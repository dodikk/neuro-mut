#ifndef __CONVERTER_TEST_H_
#define __CONVERTER_TEST_H_

#include <cppunit/TestFixture.h>
#include <cppunit/extensions/HelperMacros.h>

class ConverterTest : public CppUnit::TestFixture
{
public:
    void DoTest();

public:
    CPPUNIT_TEST_SUITE(ConverterTest);
        CPPUNIT_TEST(DoTest);
    CPPUNIT_TEST_SUITE_END();
};

#endif

