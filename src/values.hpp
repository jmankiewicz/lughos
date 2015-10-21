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

#ifndef VALUES_HPP
#define VALUES_HPP

#include <iostream>
#include <string>
#include <vector>
#include <algorithm> // for std::find
#include <iterator> // for std::begin, std::end
#include <typeinfo>       // operator typeid
#include <typeindex>
#include "errorHandling.hpp"
#include "threadSafety.hpp"
#include "log.hpp"
#include <boost/smart_ptr/shared_ptr.hpp>

#define REGISTER_CLASS_FAMILY(name) template <class T> name<T>& get ## name (name<T> &d) { return d; }

namespace lughos
{

class data
{
  
};
  
class ValueInterface : public data
{
public:
  
  ValueInterface()
  {
  }
  
  virtual ~ValueInterface()
  {
    
  }
   
  virtual std::string getValueAsString() const = 0;
  
  virtual bool setValueFromString(std::string str) = 0;
  
  virtual bool isSet() const = 0;
  
  virtual void unset() = 0;
   
};

class TypeInterface
{
public:
  
  virtual std::string getName() = 0;
  
  virtual std::string getShortDescription() = 0;
        
  virtual std::string getDescription() = 0;

};

// template <class T> class ValueDeclarationImplementation
// {
// public:
//   
// };

template <class T, class C = void> class TypeTemplate : public TypeInterface
{
  public:
    
   virtual std::string toString(const T& t) = 0;
   
   virtual T fromString(const std::string& str) = 0;
};

template <class T, class C = void> class TypeImplementation : public TypeTemplate<T,C>
{
public:
  
  virtual bool verify(T value) = 0;
  
  virtual T initialValue() = 0;
  
  virtual std::string toString(const T& t)
  {
    std::stringstream ss;
    ss << t;
    return ss.str();
  }
  
  virtual T fromString(const std::string& str)
  {
    std::stringstream ss(str);
    T t;
    ss >> t;
    return t;
  }
  
};

template <class T, class C = void> class Type : public TypeImplementation<T>
{
};

template <class T, class C = void> Type<T,C> getType(T t)
{
  return Type<T,C>();
}

template <class T> class ValueImplementation : public ValueInterface
{
private:
  mutable Mutex mutex;
protected:
  
  boost::shared_ptr<T> valuePointer;
  
  virtual T* getPtr()
  {
    SharedLock lock(this->mutex);
    return this->valuePointer.get();
  }

public:
  
  mutable Type<T> type; //TODO Should we be stricter?
    
 ValueImplementation() : mutex(), valuePointer(new T)
 {
    *(this->valuePointer) = this->type.initialValue();
 }
 
  ~ValueImplementation()
  {
  }
  
  ValueImplementation<T>(const ValueImplementation<T>& other) : ValueInterface(other), mutex(), valuePointer(other.valuePointer)
  {
  }
     
  virtual bool setValue(T value)
  {
    LUGHOS_LOG_FUNCTION()
    if(this->type.verify((T) value))
    {
      ExclusiveLock lock(this->mutex);
      this->valuePointer.reset( new T(value));
      LUGHOS_LOG(lughos::log::SeverityLevel::informative) << "Value changed to " << this->type.toString(value) << ".";
      lock.unlock();
      return true;
    }
    else
    {
      LUGHOS_LOG(lughos::log::SeverityLevel::error) << "New Value failed type-validation!";
      return false;
    }
  }
  
  virtual ValueImplementation<T>& operator=(T value)
  {
    this->setValue(value);
    return *this;
  }
  
  virtual T getValue() const
  {
    SharedLock lock(this->mutex);
    if(this->valuePointer)
      return *this->valuePointer;
    else
      BOOST_THROW_EXCEPTION(exception() << errorName("value_accessed_but_no_value_set") << errorSeverity(severity::ShouldNot));
  }
  
  virtual std::string getValueAsString() const
  {
    return type.toString(this->getValue());
  }
  
  virtual bool setValueFromString(std::string string)
  {
    return this->setValue(type.fromString(string));
  }
    
  void unset()
  {
    this->valuePointer.reset(new T);
    *(this->valuePointer) = this->type.initialValue();
  }
  
  bool isSet() const
  {
    return (bool) this->valuePointer;
  }
  
};

template <class T> class Value : public ValueImplementation<T>
{
public:
    
  Value<T>() 
  {
  }
  
  template <class E> Value<T>(Value<E> &e)
  {
    this->setValue = (T) e.getValue();
  }
  
  Value<T>(T& value)
  {
    this->setValue(value);
  }
  
  Value<T>(const Value<T>& other) : ValueImplementation<T>(other)
  {
    
  }
  
  Value<T>& operator=(const T &other)
  {
    this->setValue(other);
    return *this;
  }	
    
  Value<T>& operator=(Value<T> &other)
  {
    if(other.isSet())
      this->setValue(other.getValue());
    else
      this->unset();
    return *this;
  }
  
  operator T()
  {
    return this->getValue();
  }
  
  
};

template <class T> class Pointer : public Value<T> 
{
public:
  
  Pointer(T* ptr)
  {
    this->setPtr(ptr);
  }
  
  Pointer()
  {
    this->unsetPtr();
  }
  
  void setPtr(T* ptr)
  {
    ExclusiveLock lock(this->mutex);
    this->valuePointer.reset(ptr);
  }
  
  void unsetPtr()
  {
    this->valuePointer.reset();
  }
  
  T* getPtr()
  {
    SharedLock lock(this->mutex);
    return this->valuePointer.get();
  }
  
};

typedef ValueInterface Values;

REGISTER_CLASS_FAMILY(Type)

REGISTER_CLASS_FAMILY(Value)

} //namespace lughos
#endif