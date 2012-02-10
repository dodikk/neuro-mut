#include "stdafx.h"
#include <tchar.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/ui/text/TestRunner.h>

#include "CompilerTest.h"
CPPUNIT_TEST_SUITE_REGISTRATION(CompilerTest);

#include "VarListTest.h"
CPPUNIT_TEST_SUITE_REGISTRATION(VarListTest);


int _tmain(int argc, _TCHAR* argv[])
{
    //unit tests
    CppUnit::TextUi::TestRunner runner;

    CppUnit::TestFactoryRegistry &registry = CppUnit::TestFactoryRegistry::getRegistry();

    runner.addTest(registry.makeTest());

    return !runner.run("", false);
}

