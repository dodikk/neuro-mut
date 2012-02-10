#ifndef __MATRIX_TEST_H_
#define __MATRIX_TEST_H_

#include <cppunit/TestFixture.h>
#include <cppunit/extensions/HelperMacros.h>

class MatrixTest : public CppUnit::TestFixture
{
public:    
    virtual ~MatrixTest() {}
    void TestOutputs();
    void TestSelfConnected();
    void TestCorrupted();
    void TestCascade();
    void TestManySubgraphs();
    void TestSpiral1();

    CPPUNIT_TEST_SUITE(MatrixTest);
         CPPUNIT_TEST(TestOutputs      );
         CPPUNIT_TEST(TestSelfConnected);
         CPPUNIT_TEST(TestCorrupted    );
         CPPUNIT_TEST(TestCascade      );
         CPPUNIT_TEST(TestManySubgraphs);
         CPPUNIT_TEST(TestSpiral1);
    CPPUNIT_TEST_SUITE_END();

private:
    void Test1Outputs();

private:
    void Test1SelfConnect();

private:
    void Test1Corrupted();
    void Test2Corrupted();
};

#endif

