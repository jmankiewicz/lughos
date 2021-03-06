#ifndef MEASURED_DB_VALUE_HPP
#define MEASURED_DB_VALUE_HPP

#include <iostream>
#include <Wt/Dbo/Dbo>
#include <Wt/Dbo/backend/Sqlite3>
#include <Wt/Dbo/QueryModel>
#include <boost/asio/io_service.hpp>
#include "measuredValue.hpp"
#include "jobQueue.hpp"

using namespace std;
using namespace lughos;
namespace dbo = Wt::Dbo;

template <class T>
class measuredDBValue : public measuredValue<T>
{
public:
  
  template<class Action>
  void persist(Action& a)
  {
    dbo::field(a, this->timeStamp,     "timestamp");
    dbo::field(a, this->sensorName, "sensorName");
    dbo::field(a, this->unit,     "unit");
    if(this->isSet() && a.getsValue())
      dbo::field(a, *this->valuePointer,    "value");
    if(a.setsValue())
    {
      this->valuePointer.reset(new T()); //TODO How do we use getter and setter?
      dbo::field(a, *this->valuePointer,    "value");
    }
    
    
  }
  
  measuredDBValue(measuredValue<T> other) : measuredValue<T>(other)
  {
    
  }
  
  measuredDBValue() : measuredValue<T>()
  {
    
  }
  
};

#endif
