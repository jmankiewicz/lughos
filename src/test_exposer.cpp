#include <iostream>
#include "basicTypes.hpp"

using namespace lughos;

int multiply(int x, int y)
{
  return x * y;
}

class multiplyW : public exposedFunction<int>
{
public:
  multiplyW(std::string name, std::string description = "") : exposedFunction< int >(name,description)
  {}
  
  bool runable()
  {
    return true;
  }
  
  int exec()
  {
    return multiply(this->getValue<int>(children[0]),this->getValue<int>(children[1]));
  }
};

int main(int argc, char **argv) {
  try 
  {
    //Test exposition of variable via pointer
    std::cout << "Testing exposed pointers" << std::endl;
    int zahl = 7;
    exposedPtr<int>* test = new exposedPtr<int>(&zahl,std::string("Zahl"),std::string("Irgendeine Zahl"));
    ioRenderer<consoleContext> renderer;
    renderer.output(*test);
    renderer.input(*test);
    renderer.output(*test);
    test->getValue();
    //Test exposition of function
    std::cout << "Testing exposed functions" << std::endl;
    multiplyW m("Testfunction","Function for a test");
    exposedVar<int>* z1 = new exposedVar<int>(4,"Zahl1","");
    exposedVar<int>* z2 = new exposedVar<int>(5,"Zahl2","");
    m.addChild(z1);
    m.addChild(z2);
    std::cout << "Multiplication result of 4x5 is " << m.run() << std::endl;
  }
  catch(lughos::exception e)
  {
    std::cerr << lughos::makeErrorReport(e);
  }
    return 0;
}
