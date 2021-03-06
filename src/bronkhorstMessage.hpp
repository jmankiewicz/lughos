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
    unsigned int type;
    unsigned int node;
    unsigned int parameterType;
    unsigned int process;
    unsigned int parameter;
    unsigned int expectedStringLength;
    bool processChained;
    bool parameterChained;
    bool isStatus;
    std::string message;
    std::string hexValue;
    std::string charValue;
    unsigned int statusCode;
    unsigned int statusSubjectFirstByte;
    
  public:
    
    bronkhorstMessage()
    {
      this->processChained = false;
      this->parameterChained = false;
      this->isStatus = false;
      this->type = 0;
      this->node = 0;
      this->parameterType = 0;
      this->process = 0;
      this->parameter = 0;
      this->expectedStringLength = 0;
      this->statusCode = 0;
      this->statusSubjectFirstByte = 0;
      this->message.clear();
      this->hexValue.clear();
      this->charValue.clear();
    }
    
    bronkhorstMessage(std::string s)
    {
      this->processChained = false;
      this->parameterChained = false;
      this->isStatus = false;
      this->type = 0;
      this->node = 0;
      this->parameterType = 0;
      this->process = 0;
      this->parameter = 0;
      this->expectedStringLength = 0;
      this->statusCode = 0;
      this->statusSubjectFirstByte = 0;
      this->message.clear();
      this->hexValue.clear();
      this->charValue.clear();
      this->fromString(s);
    }
    
    operator std::string() const
    {
      return this->toString();
    }
    
    void operator()(std::string s)
    {
      this->fromString(s);
    }
    
    unsigned int getType() const
    {
      return this->type;
    }
    
    void setType(int type)
    {
      if(type > 0 && type < 10)
	this->type = type;
    }
    
    unsigned int getParameterType() const
    {
      return this->parameterType;
    }
    
    void setParameterType(int varType)
    {
      if (varType == '\x00' || varType == '\x20' || varType == '\x40' || varType == '\x60' )
	this->parameterType = varType;
    }
    
    unsigned int getNode() const
    {
      return this->node;
    }
    
    void setNode(int node)
    {
      this->node = node;
    }
    
    unsigned int getProcess() const
    {
      return this->getProcess();
    }
    
    void setProcess(int process)
    {
      this->process = process;
    }
    
    unsigned int getParameter() const
    {
      return this->parameter;
    }
    
    void setParameter(int parameter)
    {
      if (parameter > 0 && parameter < 32 )
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
    
    unsigned int getlength() const
    {
      return (this->message.size() - 2)/2;
    }
    
    unsigned int getParameterByte(bool ommitChained = false) const
    {
      std::bitset<8> bs(this->parameter);
      if(this->parameterChained && !ommitChained)
	bs[7] = true;
      else
	bs[7] = false;
      std::cout << "Calculated PARAMETERBYTE: " << bs.to_ulong() + this->parameterType << " = " << bs.to_ulong() << " + " << this->parameterType << " = " << std::hex << bs.to_ulong() + this->parameterType << std::endl;
      return bs.to_ulong() + this->parameterType;
    }
    
    void setParameterByte(int parameterType)
    {
      std::bitset<8> bs(parameterType);
      this->processChained = bs[7];
      bs[7] = false;
      std::bitset<8> tbs = bs.to_ulong() & 96;
      std::bitset<8> pbs = bs.to_ulong() & 31;
      this->parameterType = tbs.to_ulong();
      this->parameter = pbs.to_ulong();
      std::cout << "Set PARAMETERBYTE: " << parameterType << " - " << bs.to_ulong() << " - " << tbs.to_ulong() << " - " << pbs.to_ulong() << std::endl;
    }
    
    unsigned int getProcessByte(bool ommitChained = false) const
    {
      std::bitset<8> bs(this->process);
      if(this->processChained && !ommitChained)
	bs[7] = true;
      else
	bs[7] = false;
      return bs.to_ulong();
    }
    
    void setProcessByte(int processType)
    {
      std::bitset<8> bs(processType);
      this->processChained = bs[7];
      bs[7] = false;
      this->process = bs.to_ulong();
      std::cout << "PROCESSBYTE: " << processType << " - " << bs.to_ulong() << std::endl;
    }
    
    unsigned int getExpectedStringLength() const
    {
      return this->expectedStringLength;
    }
    
    void setExpectedStringLength(int expectedStringLength)
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
    
     unsigned int getStatusCode() const
     {
       return this->statusCode;
     }
     
     std::string getValueString() const
     {
	if(this->parameterType == ParameterType::String)
	  return charValue;
	std::stringstream returnStream;
	std::cout << "getValueString HEXVALUE: " << this->hexValue << std::endl;
	long unsigned int value = 0;
	std::stringstream(this->hexValue) >> std::hex >> value;
	std::cout << "getValueString VALUE: " << value << std::endl;
	switch(this->parameterType)
	{
	  case ParameterType::Character : char c; memcpy(&c,&value,sizeof(c)); returnStream << c; break;
	  case ParameterType::Float : float f; memcpy(&f,&value,sizeof(f)); returnStream << f; break;
	  case ParameterType::Integer : uint16_t i; memcpy(&i,&value,sizeof(i)); returnStream << i; break;
	  default: return std::string("ERROR");
	}
	std::cout << "getValueString STRING: " << returnStream.str() << std::endl;
	return returnStream.str();
     }
     
     template <class T> void setValueString(T newValue)
     {
       std::stringstream returnStream;
       long unsigned int value = 0;
       
	switch(this->parameterType)
	{
	  case ParameterType::Character : memcpy(&value,&newValue,sizeof(char)); returnStream << std::hex << std::setw(sizeof(char)) << std::setfill('0') << value;  break;
	  case ParameterType::Float : memcpy(&value,&newValue,sizeof(float)); returnStream << std::hex << std::setw(sizeof(float)) << std::setfill('0') << value;  break;
	  case ParameterType::Integer : memcpy(&value,&newValue,sizeof(int)); returnStream << std::hex << std::setw(sizeof(int)) << std::setfill('0') << value;  break;
	  case ParameterType::String : std::stringstream ss; ss << newValue; std::string s = ss.str();
					for (std::string::const_iterator it = s.begin(); it != s.end(); it++)
					{
					  returnStream << std::setw(2) << std::setfill('0') << std::hex  << (int) *it;
					}
					break;
	}
	this->hexValue = returnStream.str();
	std::cout << "setValueString HEXVALUE: " << this->hexValue;
     }
    
    std::string toString() const
    {
      std::stringstream ss("");
      switch (this->type) 
      {
	case 0: ss << std::hex << std::setw(2) << std::setfill('0') << this->node << std::setw(2) << this->type << std::setw(2) << this->statusCode << std::setw(2) << this->statusSubjectFirstByte ; break;
	case 1:
	case 2: ss  << std::hex  << std::setw(2) << std::setfill('0') << this->node << std::setw(2) << this->type << std::setw(2) << this->getProcessByte() << std::setw(2) << this->getParameterByte() << std::setw(2) << this->hexValue; break;
	case 4: ss  << std::hex  << std::setw(2) << std::setfill('0') <<  this->node << std::setw(2) << this->type << std::setw(2) << this->getProcessByte() << std::setw(2) << this->getParameterByte() << std::setw(2) << this->getProcessByte(true) << std::setw(2) << this->getParameterByte(true);
		if(this->type == bronkhorstMessage::ParameterType::String) 
		  ss << std::hex << std::setw(2) << std::setfill('0') << this->expectedStringLength;
		break;
	default:	return std::string("ERROR!"); break;
      }
      std::string s = ss.str();
      ss.str("");
      ss << std::setw(1) << ":" << std::hex << std::setw(2) << std::setfill('0') << ( s.size() / 2) << s << "\r\n";
      return ss.str();
    }
    
    void fromString(std::string message)
    {
      boost::regex exp1(":(([a-fA-F0-9]{2})*)\r");
      boost::cmatch res1;
      if(!boost::regex_search(message.c_str(), res1, exp1))
	return;
      else
	message = res1[1];
      
      boost::regex exp2("([a-fA-F0-9]{2})");
      boost::sregex_token_iterator nomatchIt;
      std::vector<std::string> res2;
      for (boost::sregex_token_iterator matchIt(message.begin(), message.end(), exp2, 1); matchIt != nomatchIt; matchIt++)
      {
	res2.push_back(*matchIt);
      }
      std::cout << "GOT MATCHES: " << res2.size() << " - " << res2[0] << " - " << res2[1] << " - " << res2[2] << " - " << res1[1] << std::endl;
      if(res2.size() < 5)
      {
	std::cout << "Bronkhorst message corrupt or of unknown type!" << std::endl;
	return;
      }
      this->message = message;
      std::stringstream(res2[1]) >> std::hex >> this->node;
      std::stringstream(res2[2]) >> std::hex >> this->type;
      switch(this->type)
      {
	case 0: this->isStatus = true;
		std::stringstream(res2[3]) >> std::hex >> this->statusCode;
		std::stringstream(res2[4]) >> std::hex >> this->statusSubjectFirstByte;
		break;
	case 2: unsigned int byte;
		this->isStatus = false;
		std::stringstream(res2[3]) >> std::hex >> byte; setProcessByte(byte);
		std::stringstream(res2[4]) >> std::hex >> byte; setParameterByte(byte);
		char c = '\x00';
		for(std::vector<std::string>::const_iterator it = res2.begin() + 5; it != res2.end(); it++)
		{
		  this->hexValue += *it;
		  std::stringstream(*it) >> std::hex >> c; 
		  this->charValue += c;
		}
		break;
      }
    }
    
    enum Type {Status = 0, SendParamWithAnswer = 1, SendParamNoAnswer = 2, SendParamWithSourceAdr = 3, RequestParam = 4, Instruction = 5, StopProcess = 6, StartProcess = 7, ClaimProcess = 8, UnclaimProcess = 9};
    enum ParameterType {Character = '\x00', Integer = '\x20', Float = '\x40', Long = '\x40', String = '\x60'   };
    enum Parameter {Measure = 0, Setpoint = 1, Capacity = 13};
  };
  
}//namespace lughos

#endif