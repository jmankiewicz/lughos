#ifndef RELAIS_HPP
#define RELAIS_HPP

#include <boost/asio.hpp>
#include <boost/system/error_code.hpp>
#include <boost/system/system_error.hpp>
#include <boost/bind.hpp>
#include <boost/thread.hpp>
#include <boost/logic/tribool.hpp> 

#include <string>
#include <vector>
#include <cstring>
#include "serialConnections.hpp"

#include <iostream>
#include <bitset>
#include <boost/array.hpp>
#include "device.hpp"

using namespace lughos;

class RelaisConnection : public serialConnection
{
public:
    RelaisConnection(boost::shared_ptr< boost::asio::io_service > io_service);
    RelaisConnection();
};

class Relais :public Device
{
  private:
	Relais(const Relais &p);
	Relais &operator=(const Relais &p);
	
	
  public:
	Relais();
	virtual ~Relais(void);

	void initImplementation();
	void shutdownImplementation();
	bool isConnectedImplementation();
	
	virtual std::string read_channels();
	virtual std::string write_channels(std::string channels);
	virtual std::string write_channel(int i,bool onoff);
	
	bool input_status(int sensor);
	bool input_on(int sensor);
	bool input_off(int sensor);
	std::string input_read();
	
protected:
	std::string interpretAnswer(std::string query);
	std::string composeRequest(std::string query);
	std::bitset<8> channel_bench;
	std::bitset<8> sensor_bench;
};



#endif