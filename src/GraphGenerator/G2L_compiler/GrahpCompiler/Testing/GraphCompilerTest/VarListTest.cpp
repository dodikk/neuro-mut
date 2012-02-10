#include "stdafx.h"
#include "VarListTest.h"

using namespace Parser;

void VarListTest::TestEmpty()
{
    std::string input = "";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::VarListParser parser(&inStream);
    yyparse(&parser);

    string_vt recieved = parser.GetParsedData();
    string_vt expected;

    CPPUNIT_ASSERT(recieved == expected);
}

void VarListTest::TestDistinct()
{
    std::string input = "_a:i+1+2[_c:io+1_d:o]+1-1_b:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::VarListParser parser(&inStream);
    yyparse(&parser);

    string_vt recieved = parser.GetParsedData();
    string_vt expected;
    expected.push_back("a");
    expected.push_back("c");
    expected.push_back("d");
    expected.push_back("b");

    CPPUNIT_ASSERT(recieved == expected);
}

void VarListTest::TestRepeated()
{
    std::string input = "_a:i+1+2[_c:io+1_a:o]+1-1_c:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::VarListParser parser(&inStream);
    yyparse(&parser);

    string_vt recieved = parser.GetParsedData();
    string_vt expected;
    expected.push_back("a");
    expected.push_back("c");

    CPPUNIT_ASSERT(recieved == expected);
}
