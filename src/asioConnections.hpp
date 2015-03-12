#ifndef ASIO_CONNECTIONS_HPP
#define ASIO_CONNECTIONS_HPP

#include <boost/asio.hpp>
#include <boost/system/error_code.hpp>
#include <boost/system/system_error.hpp>
#include <boost/bind.hpp>
#include <boost/thread.hpp>
#include <boost/logic/tribool.hpp>

#include <string>
#include <vector>
#include <cstring>

#include "connectionImpl.hpp"
#include "log.hpp"
#include "threadSafety.hpp"
#include <iostream>
#include <boost/array.hpp>

namespace lughos
{

/**
* @class asioConnection
* @brief Class describing asynchronous IO
*
*/
template <class C>
class asioConnection : virtual public Connection<C>
{
private:

  /**
    * @brief Copy Constructor
    *
    * @param p
    */

  asioConnection ( const asioConnection &p );

  /**
  * @brief Asignment operator
  *
  * @param p ...
  * @return asioConnection&
  */

  asioConnection &operator= ( const asioConnection &p );

  /**
  * @brief Wait-callback
  * Called at timeout.
  *
  * @param port_ ...
  * @param error ...
  * @return void
  */

  virtual void wait_callback ( boost::asio::serial_port& port_, const boost::system::error_code& error );

protected:

  typedef typename C::SocketPointer SocketPointer;

  SocketPointer socket;

  void handle_write_request ( boost::shared_ptr<Query> query, const boost::system::error_code& err );

  /**
  * @brief Callback for reading answer from port
  *
  * @param err ...
  * @return void
  */

  void handle_read_content ( boost::shared_ptr<Query> query,const boost::system::error_code& err );
  
  void handle_read_rest (const boost::system::error_code& err );




public:


  /**
  * @brief Constructor
  *
  * @param io_service ...
  */

  asioConnection() ;
  /**
    * @brief Destructor
    *
    * @param  ...
    */


  virtual ~asioConnection ( void );

  /**
    * @brief Execute query on connection.
    *
    * @param query ...
    * @return void
    */
  void execute ( boost::shared_ptr<Query> query );

  /**
    * @brief Abort all action on connection
    *
    * @param query ...
    * @return void
    */

  virtual bool test();

  virtual bool initialized();

  virtual bool connected();

  virtual void shutdown();

  virtual void abort();
  
  virtual void connect(boost::function<void ( void ) > callback = boost::function<void ( void ) >()) = 0;

  void endOfLineRegExpr ( boost::regex c );

  boost::regex endOfLineRegExpr() const;

protected:
  std::deque<char> write_msgs_;
  boost::regex endOfLineRegExpr_;
  boost::asio::streambuf response;
  boost::asio::streambuf request;
  bool isConnected;
  bool isInitialized;


  std::ostringstream response_string_stream;
  Mutex mutex;
};

                                                           

/********************************************************** 
 * Template definition in same file as needed by standard *
 **********************************************************/


template <class C> asioConnection<C>::asioConnection() : request(), response()
{
  if ( this->endOfLineRegExpr_== boost::regex ( "\r" ) )  lughos::debugLog ( "End of line char: CR" );
  else if ( this->endOfLineRegExpr_==boost::regex ( "\n" ) ) lughos::debugLog( "End of line char: NL" );
  else lughos::debugLog ( "End of line char: " + this->endOfLineRegExpr_.str() );
  this->isConnected = false;
  this->isInitialized = false;
}

template <class C> asioConnection<C>::~asioConnection ( void )
{
  this->shutdown();
}



template <class C> void asioConnection<C>::execute ( boost::shared_ptr<Query> query )
{
  std::ostream request_stream ( &request );
  request_stream<<query->getQuestion();
  if ( query->getEOLPattern().empty() )
    query->setEOLPattern ( endOfLineRegExpr_ );
  boost::system::error_code ec;
  SharedLock lock(this->mutex);
  if ( !this->initialized())
  {
    lock.unlock();
    this->initialize();
    lock.lock();
  }
  if (!this->connected())
  {
    lock.unlock();
    this->connect(boost::bind(&asioConnection<C>::execute, this, query));
    lock.lock();
  }
  lock.unlock();

  boost::asio::async_write ( *socket, request,
                             boost::bind ( &asioConnection<C>::handle_write_request, this, query,
                                 boost::asio::placeholders::error ) );

  lughos::debugLog ( std::string ( "\"" ) +query->getQuestion()+std::string ( "\" written to port." ));

  try
    {
      this->io_service->poll();
    }
  catch ( ... )
    {
      lughos::debugLog ( std::string ( "I/O-Service exception while polling." ) );
    }


  if ( socket.get() == NULL || !socket->is_open() )
    {
      lughos::debugLog ( std::string ( "Socket is closed despite writing?!" ) );
    }

  if ( this->io_service->stopped() )
    {
      lughos::debugLog ( std::string ( "I/O-Service was stopped after or during writing." ) );
    }


  return;
}


template <class C> void asioConnection<C>::handle_write_request ( boost::shared_ptr<Query> query, const boost::system::error_code& err )
{

  if ( !err )
    {
      // Read the response status line.
      boost::asio::async_read_until ( *socket, response, query->getEOLPattern(),
                                      boost::bind ( &asioConnection<C>::handle_read_content, this, query,
                                          boost::asio::placeholders::error ) );
      lughos::debugLog ( std::string ( "Reading until \"" ) + query->getEOLPattern().str() );

    }
  else
    {
      lughos::debugLog ( std::string ( "Error while writing twoway. Error: " +err.message() ) );
      ExclusiveLock lock(this->mutex);
      this->isConnected = false;
    }
}

template <class C> void asioConnection<C>::handle_read_rest ( const boost::system::error_code& err )
{

  if ( !err )
    {
      // Start reading remaining data until EOF.
      boost::asio::async_read ( *socket, response,
                                boost::asio::transfer_at_least ( 1 ),
                                boost::bind ( &asioConnection<C>::handle_read_rest, this,
                                              boost::asio::placeholders::error ) );


    }
  else if ( err == boost::asio::error::eof )
    {
      return;
    }
  else
    {
      std::cout << "Error: " << err << "\n";
    }
}

template <class C> void asioConnection<C>::handle_read_content ( boost::shared_ptr<Query> query, const boost::system::error_code& err )
{
//      this->timeoutTimer.cancel();
  if ( !err )
    {
      // Write all of the data that has been read so far.
      this->handle_read_rest ( err );
      response_string_stream.str ( std::string ( "" ) );
      response_string_stream<< &response;
      lughos::debugLog ( std::string ( "Read \"" ) + response_string_stream.str() + std::string ( "\"." ));
    }
                     else if ( err == boost::asio::error::connection_aborted || err == boost::asio::error::not_connected || err != boost::asio::error::eof || err != boost::asio::error::connection_reset )
    {
      ExclusiveLock lock(this->mutex);
      this->isConnected = false;
      lock.unlock();
      this->execute(query);
    }
  else
    {
      lughos::debugLog ( std::string ( "Unable to read. Got error: " ) +err.message() );
    }

}

template <class C> void asioConnection<C>::wait_callback ( boost::asio::serial_port& socket, const boost::system::error_code& error )
{
  //std::cout << " Calling wait-handler.";
  if ( error )
    {
      // Data was read and this timeout was canceled
      lughos::debugLog ( std::string ( "Timeout cancelled  because data was read sucessfully." ) );
      return;
    }
  //std::cout << " Timed out.";
  try
    {
      lughos::debugLog ( std::string ( "Timed out while waiting for answer." ));
      this->abort();
    }
  catch ( ... )
    {
      lughos::debugLog ( std::string ( "Exception while timeout and cancelling operation.") );
    }
}

template <class C> void asioConnection<C>::abort()
{
  try
    {
      ExclusiveLock lock(this->mutex);
      socket->cancel();
      lock.unlock();
      lughos::debugLog ( std::string ( "Aborting." ));
    }
  catch ( ... )
    {
      lughos::debugLog ( std::string ( "Error while trying to perform requested abort." ));
    }
}

template <class C> bool asioConnection<C>::connected()
{
  SharedLock lock(this->mutex);
  return this->isConnected && this->socket->is_open();
}

template <class C> bool asioConnection<C>::initialized ()
{
  SharedLock lock(this->mutex);
  return this->isInitialized;
}


template <class C> bool asioConnection<C>::test()
{
  try
    {
      this->initialize();
      this->shutdown();
      return this->initialized();
    }
  catch ( ... )
    {
      return false;
    }
}


template <class C> void asioConnection<C>::shutdown()
{

  try
    {
      ExclusiveLock lock(this->mutex);
      if ( socket )
        {
          debugLog ( std::string ( "Stopping connection" ) );
          lock.unlock();
          this->abort();
          lock.lock();
          socket->close();
          socket.reset();
          lock.unlock();
        }
    }
  catch ( ... )
    {
    }
//      io_service->stop();
//      io_service->reset();
}


template <class C> boost::regex asioConnection<C>::endOfLineRegExpr() const
{
  SharedLock lock(this->mutex);
  return this->endOfLineRegExpr_;
}

template <class C> void asioConnection<C>::endOfLineRegExpr ( boost::regex c )
{
  ExclusiveLock lock(this->mutex);
  this->endOfLineRegExpr_ = c;
}

} // namespace lughos

#endif