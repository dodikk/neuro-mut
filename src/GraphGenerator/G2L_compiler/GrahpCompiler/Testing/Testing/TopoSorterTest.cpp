#include "stdafx.h"
#include "TopoSorterTest.h"

using namespace ::Graph;
using namespace ::Graph::Algorithm;


void TopoSorterTest::TestTree()
{
    AdjacencyMatrix g(10, 10);
    g(0,0) = 0;   g(0,1) = 0;     g(0,2) = 1;    g(0,3) = 0;    g(0,4) = 0;   g(0,5) = 0;     g(0,6) = 0;    g(0,7) = 0;    g(0,8) = 0;   g(0,9) = 1;
    g(1,0) = 1;   g(1,1) = 0;     g(1,2) = 0;    g(1,3) = 0;    g(1,4) = 0;   g(1,5) = 0;     g(1,6) = 1;    g(1,7) = 0;    g(1,8) = 0;   g(1,9) = 0;
    g(2,0) = 0;   g(2,1) = 0;     g(2,2) = 0;    g(2,3) = 0;    g(2,4) = 0;   g(2,5) = 0;     g(2,6) = 0;    g(2,7) = 0;    g(2,8) = 0;   g(2,9) = 0;
    g(3,0) = 0;   g(3,1) = 0;     g(3,2) = 0;    g(3,3) = 0;    g(3,4) = 0;   g(3,5) = 0;     g(3,6) = 0;    g(3,7) = 0;    g(3,8) = 0;   g(3,9) = 0;
    g(4,0) = 0;   g(4,1) = 0;     g(4,2) = 0;    g(4,3) = 0;    g(4,4) = 0;   g(4,5) = 0;     g(4,6) = 0;    g(4,7) = 0;    g(4,8) = 0;   g(4,9) = 0;
    g(5,0) = 0;   g(5,1) = 1;     g(5,2) = 0;    g(5,3) = 0;    g(5,4) = 0;   g(5,5) = 0;     g(5,6) = 0;    g(5,7) = 0;    g(5,8) = 1;   g(5,9) = 0;
    g(6,0) = 0;   g(6,1) = 0;     g(6,2) = 0;    g(6,3) = 0;    g(6,4) = 1;   g(6,5) = 0;     g(6,6) = 0;    g(6,7) = 1;    g(6,8) = 0;   g(6,9) = 0;
    g(7,0) = 0;   g(7,1) = 0;     g(7,2) = 0;    g(7,3) = 0;    g(7,4) = 0;   g(7,5) = 0;     g(7,6) = 0;    g(7,7) = 0;    g(7,8) = 0;   g(7,9) = 0;
    g(8,0) = 0;   g(8,1) = 0;     g(8,2) = 0;    g(8,3) = 1;    g(8,4) = 0;   g(8,5) = 0;     g(8,6) = 0;    g(8,7) = 0;    g(8,8) = 0;   g(8,9) = 0;
    g(9,0) = 0;   g(9,1) = 0;     g(9,2) = 0;    g(9,3) = 0;    g(9,4) = 0;   g(9,5) = 0;     g(9,6) = 0;    g(9,7) = 0;    g(9,8) = 0;   g(9,9) = 0;

    TopoSorter sorter;
    TopoSorter::Items received = sorter.Sort(g);

    TopoSorter::Items expected;

    //                                   w, i
    expected.push_back(TopoSorter::Item(10, 5));
    expected.push_back(TopoSorter::Item(7 , 1));
    expected.push_back(TopoSorter::Item(3 , 6));
    expected.push_back(TopoSorter::Item(3 , 0));
    expected.push_back(TopoSorter::Item(2 , 8));
    expected.push_back(TopoSorter::Item(1 , 9));
    expected.push_back(TopoSorter::Item(1 , 7));
    expected.push_back(TopoSorter::Item(1 , 4));
    expected.push_back(TopoSorter::Item(1 , 3));
    expected.push_back(TopoSorter::Item(1 , 2));

    CPPUNIT_ASSERT(received == expected);
}

void TopoSorterTest::TestBoostSample()
{
    AdjacencyMatrix g(6, 6);
    g(0,0) = 0;   g(0,1) = 1;     g(0,2) = 0;    g(0,3) = 1;    g(0,4) = 0;    g(0,5) = 0;
    g(1,0) = 0;   g(1,1) = 0;     g(1,2) = 0;    g(1,3) = 0;    g(1,4) = 1;    g(1,5) = 0;
    g(2,0) = 0;   g(2,1) = 0;     g(2,2) = 0;    g(2,3) = 0;    g(2,4) = 1;    g(2,5) = 1;
    g(3,0) = 0;   g(3,1) = 0;     g(3,2) = 0;    g(3,3) = 0;    g(3,4) = 0;    g(3,5) = 0;
    g(4,0) = 0;   g(4,1) = 0;     g(4,2) = 0;    g(4,3) = 1;    g(4,4) = 0;    g(4,5) = 0;
    g(5,0) = 0;   g(5,1) = 0;     g(5,2) = 0;    g(5,3) = 0;    g(5,4) = 0;    g(5,5) = 0;


    TopoSorter sorter;
    TopoSorter::Items received = sorter.Sort(g);

    TopoSorter::Items expected;

    //                                  w, i
    expected.push_back(TopoSorter::Item(4, 2));
    expected.push_back(TopoSorter::Item(4, 0));
    expected.push_back(TopoSorter::Item(3, 1));
    expected.push_back(TopoSorter::Item(2, 4));
    expected.push_back(TopoSorter::Item(1, 5));
    expected.push_back(TopoSorter::Item(1, 3));


    CPPUNIT_ASSERT(received == expected);
}

void TopoSorterTest::TestModifiedBoostSample()
{
    AdjacencyMatrix g(10, 10);
    g(0,0) = 0;   g(0,1) = 1;     g(0,2) = 0;    g(0,3) = 1;    g(0,4) = 0;    g(0,5) = 0;     g(0,6) = 0;    g(0,7) = 0;    g(0,8) = 0;   g(0,9) = 0;
    g(1,0) = 0;   g(1,1) = 0;     g(1,2) = 0;    g(1,3) = 0;    g(1,4) = 1;    g(1,5) = 0;     g(1,6) = 0;    g(1,7) = 0;    g(1,8) = 0;   g(1,9) = 0;
    g(2,0) = 0;   g(2,1) = 0;     g(2,2) = 0;    g(2,3) = 0;    g(2,4) = 1;    g(2,5) = 1;     g(2,6) = 1;    g(2,7) = 0;    g(2,8) = 0;   g(2,9) = 0;
    g(3,0) = 0;   g(3,1) = 0;     g(3,2) = 0;    g(3,3) = 0;    g(3,4) = 0;    g(3,5) = 0;     g(3,6) = 0;    g(3,7) = 0;    g(3,8) = 0;   g(3,9) = 0;
    g(4,0) = 0;   g(4,1) = 0;     g(4,2) = 0;    g(4,3) = 1;    g(4,4) = 0;    g(4,5) = 0;     g(4,6) = 0;    g(4,7) = 0;    g(4,8) = 0;   g(4,9) = 0;
    g(5,0) = 0;   g(5,1) = 0;     g(5,2) = 0;    g(5,3) = 0;    g(5,4) = 0;    g(5,5) = 0;     g(5,6) = 0;    g(5,7) = 0;    g(5,8) = 0;   g(5,9) = 0;
    g(6,0) = 0;   g(6,1) = 0;     g(6,2) = 0;    g(6,3) = 0;    g(6,4) = 0;    g(6,5) = 0;     g(6,6) = 0;    g(6,7) = 1;    g(6,8) = 1;   g(6,9) = 0;
    g(7,0) = 0;   g(7,1) = 0;     g(7,2) = 0;    g(7,3) = 0;    g(7,4) = 0;    g(7,5) = 0;     g(7,6) = 0;    g(7,7) = 0;    g(7,8) = 0;   g(7,9) = 0;
    g(8,0) = 0;   g(8,1) = 0;     g(8,2) = 0;    g(8,3) = 0;    g(8,4) = 0;    g(8,5) = 0;     g(8,6) = 0;    g(8,7) = 0;    g(8,8) = 0;   g(8,9) = 1;
    g(9,0) = 0;   g(9,1) = 0;     g(9,2) = 0;    g(9,3) = 0;    g(9,4) = 0;    g(9,5) = 0;     g(9,6) = 0;    g(9,7) = 0;    g(9,8) = 0;   g(9,9) = 0;

    TopoSorter sorter;
    TopoSorter::Items received = sorter.Sort(g);

    TopoSorter::Items expected;

    //                                  w, i
    expected.push_back(TopoSorter::Item(8, 2));
    expected.push_back(TopoSorter::Item(4, 6));
    expected.push_back(TopoSorter::Item(4, 0));
    expected.push_back(TopoSorter::Item(3, 1));
    expected.push_back(TopoSorter::Item(2, 8));
    expected.push_back(TopoSorter::Item(2, 4));
    expected.push_back(TopoSorter::Item(1, 9));
    expected.push_back(TopoSorter::Item(1, 7));
    expected.push_back(TopoSorter::Item(1, 5));
    expected.push_back(TopoSorter::Item(1, 3));

    CPPUNIT_ASSERT(received == expected);
}

void TopoSorterTest::TestCascade()
{
    AdjacencyMatrix g(4, 4);
    g(0,0) = 0;   g(0,1) = 1;     g(0,2) = 1;    g(0,3) = 1;
    g(1,0) = 0;   g(1,1) = 0;     g(1,2) = 1;    g(1,3) = 1;
    g(2,0) = 0;   g(2,1) = 0;     g(2,2) = 0;    g(2,3) = 1;
    g(3,0) = 0;   g(3,1) = 0;     g(3,2) = 0;    g(3,3) = 0;


    TopoSorter sorter;
    TopoSorter::Items received = sorter.Sort(g);

    TopoSorter::Items expected;

    //                                  w, i
    expected.push_back(TopoSorter::Item(4, 0));
    expected.push_back(TopoSorter::Item(3, 1));
    expected.push_back(TopoSorter::Item(2, 2));
    expected.push_back(TopoSorter::Item(1, 3));

    CPPUNIT_ASSERT(received == expected);
}

