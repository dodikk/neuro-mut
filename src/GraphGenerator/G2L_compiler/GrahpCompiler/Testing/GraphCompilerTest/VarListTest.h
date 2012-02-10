#ifndef __VAR_LIST_TEST_H_
#define __VAR_LIST_TEST_H_

#include <cppunit/TestFixture.h>
#include <cppunit/extensions/HelperMacros.h>

class VarListTest : public CppUnit::TestFixture
{
public:    
    virtual ~VarListTest() {}
    void TestEmpty();
    void TestDistinct();
    void TestRepeated();

    CPPUNIT_TEST_SUITE(VarListTest);
    CPPUNIT_TEST(TestEmpty      );
    CPPUNIT_TEST(TestRepeated);
    CPPUNIT_TEST(TestDistinct    );
    CPPUNIT_TEST_SUITE_END();
};

#endif
