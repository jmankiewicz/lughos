#ifndef BRONKHORST_MESSAGE_HPP
#define BRONKHORST_MESSAGE_HPP
#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>
#include <bitset>
#include <boost/regex.hpp>

namespace lughos
{
  class bronkhorstMessage
  {
  protected:
    uint8_t type;
    uint8_t node;
    uint8_t parameterType;
    uint8_t process;
    uint8_t parameter;
    uint8_t expectedStringLength;
    bool processChained;
    bool parameterChained;
    bool isStatus;
    std::string message;
    std::string hexValue;
    std::string charValue;
    uint8_t statusCode;
    uint8_t statusSubjectFirstByte;
    
  public:
    
    bronkhorstMessage()
    {
      this->processChained = false;
      this->parameterChained = false;
      this->isStatus = false;
    }
    
    bronkhorstMessage(std::string s)
    {
      this->processChained = false;
      this->parameterChained = false;
      this->isStatus = false;
      this->fromString(s);
    }
    
    operator std::string() const
    {
      return this->toString();
    }
    
    void operator()(std::string)
    {
      
    }
    
    uint8_t getType() const
    {
      return this->type;
    }
    
    void setType(uint8_t type)
    {
      if(type > 0 && type < 10)
	this->type = type;
    }
    
    uint8_t getParameterType() const
    {
      return this->parameterType;
    }
    
    void setParameterType(uint8_t varType)
    {
      if (varType == '\x00' || varType == '\x20' || varType == '\x40' || varType == '\x60' )
	this->parameterType = varType;
    }
    
    uint8_t getNode() const
    {
      return this->node;
    }
    
    void setNode(uint8_t node)
    {
      this->node = node;
    }
    
    uint8_t getProcess() const
    {
      return this->getProcess();
    }
    
    void setProcess(uint8_t process)
    {
      this->process = process;
    }
    
    uint8_t getParameter() const
    {
      return this->parameter;
    }
    
    void setParameter(uint8_t parameter)
    {
      if (this->parameter > 0 && this->parameter < 32 )
	this->parameter = parameter;
    }
    
    bool getProcessChained() const
    {
      return this->processChained;
    }
    
    void setProcessChained(bool processChained)
    {
      this->processChained = processChained;
    }
    
    bool getParameterChained() const
    {
      return this->parameterChained;
    }
    
    void setParameterChained(bool parameterChained)
    {
      this->parameterChained = parameterChained;
    }
    
    uint8_t getlength() const
    {
      return this->message.size() - 2;
    }
    
    uint8_t getParameterByte() const
    {
      return this->parameter + this->parameterType + this->parameterChained ? '\x80' : 0;
    }
    
    void setParameterByte(uint8_t parameterType)
    {
      std::bitset<8> bs(parameterType);
      this->processChained = bs[7];
      bs[7] = false;
      std::bitset<8> tbs = bs.to_ulong() & 96;
      std::bitset<8> pbs = bs.to_ulong() & 31;
      this->parameterType = tbs.to_ulong();
      this->parameter = pbs.to_ulong();
    }
    
    uint8_t getProcessByte() const
    {
      return this->process + this->processChained ? '\x80' : 0; 
    }
    
    void setProcessByte(uint8_t processType)
    {
      std::bitset<8> bs(processType);
      this->processChained = bs[7];
      bs[7] = false;
      this->process = bs.to_ulong();
    }
    
    uint8_t getExpectedStringLength() const
    {
      return this->expectedStringLength;
    }
    
    void setExpectedStringLength(uint8_t expectedStringLength)
    {
      if(expectedStringLength > 1)
	this->expectedStringLength = expectedStringLength;
    }
    
    bool isStatusMessage() const
    {
      return this->isStatus;
    }
    
    bool isErrorMessage() const
    {
      return this->isStatus && this->statusCode != '\x00';
    }
    
     uint8_t getStatusCode() const
     {
       return this->statusCode;
     }
     
     std::string getValueString() const
     {
	std::stringstream returnStream;
	switch(this->parameterType)
	{
	  case ParameterType::Character : char c; std::stringstream(this->hexValue) >> std::hex >> c; returnStream << c; break;
	  case ParameterType::Float : float f; std::stringstream(this->hexValue) >> std::hex >> f; returnStream << f; break;
	  case ParameterType::Integer : uint16_t i; std::stringstream(this->hexValue) >> std::hex >> i; returnStream << i; break;
	  case ParameterType::String : return this->charValue; break;
	  default: return std::string("");
	}
     }
     
     template <class T> void setValueString(T value)
     {
       std::stringstream returnStream;
	switch(this->parameterType)
	{
	  case ParameterType::Character : char c = value; returnStream << std::setw(2) << std::setfill('0') << std::hex  <<  c; break;
	  case ParameterType::Float : float f = value; returnStream << std::setw(2) << std::setfill('0') << std::hex  << f; break;
	  case ParameterType::Integer : uint16_t i = value; returnStream << std::setw(2) << std::setfill('0') << std::hex  << i; break;
	  case ParameterType::String : std::string s = value; 
					for (std::string::const_iterator it = s.begin(); it != s.end(); it++)
					{
					  returnStream << std::setw(2) << std::setfill('0') << std::hex  << (uint8_t) it*;
					}
					break;
	}
	this->hexValue = returnStream.str();
     }
    
    std::string toString() const
    {
      std::stringstream ss("");
      switch (type) 
      {
	case 1:
	case 2: ss << std::setw(2) << std::setfill('0') << std::hex  << this->node << this->type << this->getProcessByte() << this->getParameterByte() << this->hexValue  ; break;
	case 4: ss << std::setw(2) << std::setfill('0') << std::hex  <<  this->node << this->type << this->getProcessByte() << this->getParameterByte() << this->process << this->parameter;
		if(this->type == bronkhorstMessage::ParameterType::String) 
		  ss << std::hex << std::setw(2) << std::setfill('0') << this->expectedStringLength;
		break;
	default:	return std::string("ERROR!"); break;
      }
      std::string s = ss.str();
      std::cout << "STRING: " << s << std::endl;
      ss.str("");
      ss << std::setw(1) << ":" << std::hex << std::setw(2) << std::setfill('0') << ( s.size() / 2) << s << "\r\n";
      return ss.str();
    }
    
    void fromString(std::string message)
    {
      boost::regex exp1(":(..)*\r");
      boost::cmatch res1;
      boost::regex_search(message.c_str(), res1, exp1);
      this->message = res1[0];
      std::stringstream(res1[2]) >> std::hex >> this->node;
      std::stringstream(res1[3]) >> std::hex >> this->type;
      switch(this->type)
      {
	case 0: this->isStatus = true;
		std::stringstream(res1[4]) >> std::hex >> this->statusCode;
		std::stringstream(res1[3]) >> std::hex >> this->statusSubjectFirstByte;
		break;
	case 2: uint8_t byte;
		this->isStatus = false;
		std::stringstream(res1[4]) >> std::hex >> byte; setProcessByte(byte);
		std::stringstream(res1[5]) >> std::hex >> byte; setParameterByte(byte);
		char c = '\x00';
		for(boost::cmatch::const_iterator it = res1.begin() + 6; it != res1.end(); it++)
		{
		  std::stringstream(*it) >> this->hexValue;
		  std::stringstream(*it) >> std::hex >> c; 
		  this->charValue += c;
		}
		break;
      }
    }
    
    enum Type {Status = 0, SendParamWithAnswer = 1, SendParamNoAnswer = 2, SendParamWithSourceAdr = 3, RequestParam = 4, Instruction = 5, StopProcess = 6, StartProcess = 7, ClaimProcess = 8, UnclaimProcess = 9};
    enum ParameterType {Character = '\x00', Integer = '\x20', Float = '\x40', Long = '\x40', String = '\x60'   };
    enum Parameter {Setpoint = 1, Capacity = 13};
  };
  
}//namespace lughos

#endif