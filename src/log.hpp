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

#ifndef LOG_HPP
#define LOG_HPP

#define BOOST_LOG_DYN_LINK 1

#include <iostream>
#include <sstream>
#include <ostream>
#include <boost/date_time/posix_time/posix_time.hpp>
#include <boost/filesystem.hpp>

#include <string>
#include <sstream>
#include <boost/current_function.hpp>
#include <boost/thread/mutex.hpp>
#include <boost/log/attributes.hpp>
#include <boost/log/sinks.hpp>
#include <boost/log/sources/record_ostream.hpp>
#include <boost/log/sources/severity_channel_logger.hpp>
#include <boost/log/sources/severity_feature.hpp>
#include <boost/log/attributes/scoped_attribute.hpp>
#include <boost/log/utility/setup/console.hpp>
#include <boost/log/utility/setup/file.hpp>
#include <boost/log/utility/setup/common_attributes.hpp>

#define DEBUG_THRESHOLD_CERR 1.0
#define DEBUG_THRESHOLD_FILE 1.0
#define DEBUG_THRESHOLD_DB 1.0



namespace lughos 
{
  namespace log
  {
    enum SeverityLevel
    {
        debug,
        informative,
        notification,
        warning,
        error,
        critical,
        catastrophic
    };
  }
  

  class LoggingService
  {
  public:
    
    boost::shared_ptr< boost::log::sinks::synchronous_sink< boost::log::sinks::text_file_backend > > fileSink;
    boost::shared_ptr< boost::log::sinks::synchronous_sink< boost::log::sinks::text_ostream_backend > > consoleSink;
    
    boost::shared_ptr<boost::log::sources::severity_channel_logger_mt<log::SeverityLevel>> logger;
    
    LoggingService()
    {
       std::cout.sync_with_stdio(true);
       this->logger.reset(new boost::log::sources::severity_channel_logger_mt<log::SeverityLevel>());
       fileSink = boost::log::add_file_log
       (
        boost::log::keywords::file_name = "lughos_%N.log",                                        
        boost::log::keywords::rotation_size = 10 * 1024 * 1024,                                   
        boost::log::keywords::time_based_rotation = boost::log::sinks::file::rotation_at_time_point(0, 0, 0), 
        boost::log::keywords::format = "[%LineID%:%TimeStamp%][%ThreadID%@%Scope%]: <%Severity%>  %Message%"
       );
       consoleSink = boost::log::add_console_log
       (
         std::cout,
         boost::log::keywords::format = "[%LineID%:%TimeStamp%][%ThreadID%@%Scope%]: <%Severity%>  %Message%"
       );
//        consoleSink->set_filter(boost::log::attributes::expr::attr< int >("Severity") >= 3);
       consoleSink->locked_backend()->auto_flush(true);
       
       boost::shared_ptr< boost::log::core > core = boost::log::core::get();
       core->add_global_attribute("LineID", boost::log::attributes::counter< unsigned int >(1));
       core->add_global_attribute("ThreadID", boost::log::attributes::current_thread_id());
       core->add_global_attribute("Scope", boost::log::attributes::named_scope());
       core->add_global_attribute("TimeStamp", boost::log::attributes::local_clock());
//        core->add_global_attribute("Severity", boost::log::trivial::severity());
    }
    
    boost::log::sources::severity_channel_logger_mt<log::SeverityLevel>& operator()()
    {
      return *this->logger;
    }
    
  };
  
  extern LoggingService systemLog;
  
  #define LUGHOS_LOG(x) BOOST_LOG_SEV(lughos::systemLog(),x)
  #define LUGHOS_LOG_FUNCTION() BOOST_LOG_FUNCTION()  
} //namespace lughos

#endif