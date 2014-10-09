// #include "StdAfx.h"

#include <ostream>
// #pragma comment(lib, "Setupapi.lib")
#include "serialSync.hpp"
#include "serialAsync.hpp"
#include "coolpak6000.hpp"


coolpak6000::coolpak6000(void)
{
 
set_default();

}



coolpak6000::~coolpak6000(void)
{

}

void coolpak6000::compose_request(const std::string &buf)
{
//         std::cout<<"composed_"<<std::endl;
//   boost::asio::streambuf buff;
//   std::ostream request_stream(&buff);

    std::ostream request_stream(&request_);

    request_stream<<"\x02" <<buf.c_str()<< "\r";
//       std::cout<<"composed_"<<&request_<<std::endl;
    return;
  
}

   std::string coolpak6000::inputoutput(const std::string input, const int async)
{
    if (async==0)write(input);
    else if (async==1)write_async(input);
    else write(input);
    return read();
}

   void coolpak6000::set_default()
{
    this->baud_rate=boost::asio::serial_port_base::baud_rate(4800);
    this->flow_control=boost::asio::serial_port_base::flow_control::none;
    this->character_size=boost::asio::serial_port_base::character_size(8);
    this->end_of_line_char_='\r';
    this->parity=boost::asio::serial_port_base::parity::none;
    this->stop_bits=boost::asio::serial_port_base::stop_bits::one;
}

std::string coolpak6000::read()
{
        std::string s = response_string_stream.str();

	response_string_stream.str("");
	
// 	static const boost::regex e("^\\D*(\\d*)\\D$");
// 	 boost::cmatch res;
// 	 boost::regex_search(s.c_str(), res, e);
    return s;  

}

   bool coolpak6000::compressor_on()
{
  std::string response=this->inputoutput("SYS1");
  if(response.c_str()=="SYS1")return true;
  else if(response.c_str()=="SYS2")return false;
  else return false; 
  
}

   bool coolpak6000::compressor_off()
{
  std::string response=this->inputoutput("SYS0");
  if(response.c_str()=="SYS0")return true;
  else if(response.c_str()=="SYS2")return false;
  else return false; 
  
}

   std::string coolpak6000::get_data()
{
  std::string  s ="DAT4.01/017091/17090/24.9/11.8/09.3/000/1/1/1/0/00/0000000000000000/00";//this->inputoutput("DAT");
  
//   	 static const boost::regex e("\\/(.*)\\/");
	   	 static const boost::regex e("([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)");

	 boost::cmatch res;
	 boost::regex_search(s.c_str(), res, e);
	 
	 software_version= res[1];
	 operating_hours.setunitvalue(boost::lexical_cast<double>(res[3]), "h");
	 delay.setunitvalue(boost::lexical_cast<double>(res[7]), "sec");
	 compressor_state=boost::lexical_cast<int>(res[8]);
	 command_state=boost::lexical_cast<int>(res[9]);
	 coolhead1_state=boost::lexical_cast<int>(res[10]);
	 coolhead1_state=boost::lexical_cast<int>(res[11]);
	 number_of_errors= boost::lexical_cast<int>(res[12]);
	std::string errorstring =res[13];
	int number_of_saved_errors = boost::lexical_cast<int>(res[14]);
// 	 std::cout<<res[1]<<std::endl;
//  for(int i=1; i<2; i++)std::cout<<res[i]<<std::endl;
  return s;
  
}

   std::string coolpak6000::get_error_list()
{
  return this->inputoutput("ERR");
  
}

   bool coolpak6000::coolhead_on(int head)
{
 
  std::string request("SC" +std::to_string(head)+std::to_string(1));
   
  std::string response=this->inputoutput(request);
  if(response.c_str()==request.c_str())return true;
  else return false; 
  
}

   bool coolpak6000::coolhead_off(int head)
{
  std::string request("SC" +std::to_string(head)+std::to_string(0));
   
  std::string response=this->inputoutput(request);
  if(response.c_str()==request.c_str())return true;
  else return false; 
  
}

std::string coolpak6000::get_software_version()
{
  get_data();
  return software_version;
}

int coolpak6000::get_compressor_state()
{
  get_data();
  return compressor_state;
}

int coolpak6000::get_command_state()
{
  get_data();
  return command_state;
}
int coolpak6000::get_coolhead1_state()
{
  get_data();
  return coolhead1_state;
}
int coolpak6000::get_coolhead2_state()
{
  get_data();
  return coolhead2_state;
}
int coolpak6000::get_number_of_errors()
{
  get_data();
  return number_of_errors;
}
std::string coolpak6000::get_errorstring(){
  get_data();
  return errorstring;
}
int coolpak6000::get_number_of_saved_errors(){
  get_data();
  return number_of_saved_errors;
}

unitValue coolpak6000::get_delay(){
  get_data();
  unitValue del =delay;
  return del;
}

unitValue coolpak6000::get_operating_hours(){
  get_data();
  unitValue op=operating_hours;
  return op;
}