#ifndef __TOPO_SORTER_TEST_H__
#define __TOPO_SORTER_TEST_H__

#include <cppunit/TestFixture.h>
#include <cppunit/extensions/HelperMacros.h>

class TopoSorterTest : public CppUnit::TestFixture
{
public:
    void TestTree();
    void TestBoostSample();
    void TestModifiedBoostSample();
    void TestCascade();

public:
    CPPUNIT_TEST_SUITE(TopoSorterTest);
        CPPUNIT_TEST(TestTree);
        CPPUNIT_TEST(TestBoostSample);
        CPPUNIT_TEST(TestModifiedBoostSample);
        CPPUNIT_TEST(TestCascade);
    CPPUNIT_TEST_SUITE_END();
};


#endif
