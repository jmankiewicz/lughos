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
#include <boost/function.hpp>
#include <boost/fusion/adapted.hpp>
#include <boost/fusion/include/invoke.hpp>
#include <boost/spirit/home/qi.hpp>
#include <boost/spirit/include/qi_auto.hpp>
#include <boost/spirit/include/qi_char.hpp>

using namespace std;
using namespace boost::spirit;

#define PARSER_DEF(a) using type = decltype(boost::proto::deep_copy(a)); static type call() { return boost::proto::deep_copy(a); }

namespace boost { namespace spirit { namespace traits {
  
  template <> 
  struct create_parser<std::string>
  {
    PARSER_DEF('"' >> +(boost::spirit::qi::char_ - '"') >> '"');
  };
  
}}} //TODO boost.fusion invoke !

boost::fusion::vector<int,std::string> p;

#undef PARSER_DEF

void test(int i, std::string s)
{
  cout << "Got  values: " << i << " and " << s << endl;
}

int main()
{
  std::string input("42 \"Test\"");
  boost::function<void (int, std::string)> f(&test);
    if(qi::phrase_parse(input.begin(),input.end(),p,qi::space))
    {
      cout << "MATCH: " << boost::fusion::at_c<0>(p) << " - " << boost::fusion::at_c<1>(p) <<  endl;
      boost::fusion::invoke(f,p);
    }
  return 0;
}