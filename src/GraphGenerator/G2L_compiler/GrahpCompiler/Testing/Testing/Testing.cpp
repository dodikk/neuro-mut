#include "stdafx.h"
#include <tchar.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/ui/text/TestRunner.h>

#include "MatrixTest.h"
CPPUNIT_TEST_SUITE_REGISTRATION(MatrixTest);

#include "ConverterTest.h"
CPPUNIT_TEST_SUITE_REGISTRATION(ConverterTest);

#include "TopoSorterTest.h"
CPPUNIT_TEST_SUITE_REGISTRATION(TopoSorterTest);


int _tmain(int argc, _TCHAR* argv[])
{
    //unit tests
    CppUnit::TextUi::TestRunner runner;

    CppUnit::TestFactoryRegistry &registry = CppUnit::TestFactoryRegistry::getRegistry();

    runner.addTest(registry.makeTest());

    return !runner.run("", false);
}

