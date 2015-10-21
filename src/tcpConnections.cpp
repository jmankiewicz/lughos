/********************************************************************************
 *   This file is part of LUGHOS.						*
 *										*
 *										*
 *  LUGHOS is free software: you can redistribute it and/or modify		*
 *  it under the terms of the GNU General Public License as published by	*
 *  the Free Software Foundation, either version 3 of the License, or		*
 *  (at your option) any later version.						*
 *										*
 *  LUGHOS is distributed in the hope that it will be useful,			*
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of		*
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the		*
 *  GNU General Public License for more details.				*
 *										*
 *  We sincerily invite everybody to participate in LUGHO'S development. 	*
 *  Together we can achieve more.						*
 *										*
 *  (c) 2014, 2015 Jörn Mankiewicz (joern.mankiewicz@gmx.de), 			*
 *                 Irina Brodski (irina@brodski.de)				*
 *										*
 ********************************************************************************/

#include <iostream>
#include <fstream>

#include "tcpConnections.hpp"
#include "log.hpp"

#ifdef WIN32
#include <windows.h>
#include <winioctl.h>
#endif

using namespace lughos;

tcpConnection::tcpConnection() : endpoint(new tcp::endpoint())
{
this->isConnected = false;
this->endOfLineRegExpr_ = boost::regex ( "\n" );
}

tcpConnection::~tcpConnection(void)
{
// 	stop();
}

void tcpConnection::initialize()
{
  ExclusiveLock lock(this->mutex);
  this->isConnected = false;
  this->isInitialized = false;
    if (server_name.empty()||port_name.empty()) {
		LUGHOS_LOG(log::SeverityLevel::informative) << "Connection not initialized. Please set server/port name!" ;
		return;
	}
    LUGHOS_LOG(log::SeverityLevel::informative) << ("Initializing TCP-connection to " + server_name + ":" + port_name) ;
    resolver.reset(new tcp::resolver(*this->io_service));
    query.reset(new tcp::resolver::query(server_name, port_name));
    socket.reset(new boost::asio::ip::tcp::socket(*this->io_service));
    endpoint.reset(new tcp::endpoint());
    this->isInitialized = true;
}

void tcpConnection::set_port(std::string port)
{
  ExclusiveLock lock(this->mutex);
  port_name=port;
}

void tcpConnection::connect(boost::function<void(const boost::system::error_code& err)> callback)
{
  ExclusiveLock lock(this->mutex);
  this->socket.reset(new tcp::socket(*io_service));
  if (!this->endpoint->address().is_unspecified())
  {
    socket->async_connect(*this->endpoint,
        this->ioStrand->wrap(boost::bind(&tcpConnection::handle_connect, this, callback,
          boost::asio::placeholders::error, tcp::resolver::iterator())));
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Connecting to server ")+server_name) ;
  }
  else
  {
    resolver->async_resolve(*this->query, this->ioStrand->wrap(boost::bind(&tcpConnection::handle_resolve, this, callback,
          boost::asio::placeholders::error, boost::asio::placeholders::iterator)));
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Trying to resolve ") + server_name) ;
  }
}

void tcpConnection::disconnect()
{
  this->abort();
}

void tcpConnection::handle_resolve(boost::function<void(const boost::system::error_code& err)> callback, const boost::system::error_code& err,
      tcp::resolver::iterator endpoint_iterator)
{

  if (!err)
  {
    ExclusiveLock lock(this->mutex);
    *this->endpoint = *endpoint_iterator;
    socket->async_connect(*this->endpoint,
        this->ioStrand->wrap(boost::bind(&tcpConnection::handle_connect, this, callback,
          boost::asio::placeholders::error, ++endpoint_iterator)));
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Resolved address of server ")+server_name) ;
  }
  else
  {
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Unable to resolve address of server ")+server_name+std::string(". Got error: ")+err.message()) ;
  }

}

void tcpConnection::handle_connect(boost::function<void (const boost::system::error_code& err)> callback, const boost::system::error_code& err,
      tcp::resolver::iterator endpoint_iterator)
{ 
  if(!err)
  {
    ExclusiveLock lock(this->mutex);
    this->isConnected = true;
    lock.unlock();
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Connected successfully to ")+server_name) ;
    boost::asio::socket_base::keep_alive keepAlive(true);
    socket->set_option(keepAlive); //Seems to be only allowed after connect :/
    if(callback)
      callback(err);
    return;
  }
  else if (err == boost::asio::error::already_connected)
  {
    ExclusiveLock lock(this->mutex);
    this->isConnected = true;
    lock.unlock();
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Already connected to ")+server_name) ;
    boost::asio::socket_base::keep_alive keepAlive(true);
    socket->set_option(keepAlive); //Seems to be only allowed after connect :/
    if(callback)
      callback(err);
    return;
  }
  else if (endpoint_iterator != tcp::resolver::iterator())
  {
    // The connection failed. Try the next endpoint in the list.
    ExclusiveLock lock(this->mutex);
    socket.reset(new boost::asio::ip::tcp::socket(*this->io_service));
    *this->endpoint = *endpoint_iterator;
    socket->async_connect(*this->endpoint,
        this->ioStrand->wrap(boost::bind(&tcpConnection::handle_connect, this, callback,
          boost::asio::placeholders::error, ++endpoint_iterator)));
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Connection failed, trying next possible resolve of ")+server_name) ;
  }
  else
  {
    ExclusiveLock lock(this->mutex);
    LUGHOS_LOG(log::SeverityLevel::informative) << (std::string("Unable to connect to server ")+server_name+std::string(". Got error: ")+err.message()) ;
    this->endpoint.reset(new tcp::endpoint);
    return;
  }
}

void tcpConnection::shutdown()
{
  this->abort();
  ExclusiveLock lock(this->mutex);
  if(socket)
    this->socket->close();
  this->socket.reset();
  this->query.reset();
  this->resolver.reset();
  this->endpoint.reset();
  this->isInitialized = false;
  return;
}