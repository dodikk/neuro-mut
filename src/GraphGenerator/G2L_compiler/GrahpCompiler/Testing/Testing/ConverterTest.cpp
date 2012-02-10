#include "StdAfx.h"
#include "ConverterTest.h"

using namespace ::Graph;
using namespace ::Graph::Algorithm;
using namespace boost::graph;

void ConverterTest::DoTest()
{
    typedef std::pair<int,int> Pair;

    {
        const size_t count = 6;
        Pair edges[count] = 
        {   
            Pair(0,1), 
            Pair(2,4),
            Pair(2,5),
            Pair(0,3), 
            Pair(1,4),
            Pair(4,3) 
        };
        BoostGraph G(count);
        for (int i = 0; i < count; ++i)
        {
            add_edge(edges[i].first, edges[i].second, G);
        }



        AdjacencyMatrix expected(6, 6);
        expected(0,0) = 0;   expected(0,1) = 1;     expected(0,2) = 0;    expected(0,3) = 1;    expected(0,4) = 0;    expected(0,5) = 0;
        expected(1,0) = 0;   expected(1,1) = 0;     expected(1,2) = 0;    expected(1,3) = 0;    expected(1,4) = 1;    expected(1,5) = 0;
        expected(2,0) = 0;   expected(2,1) = 0;     expected(2,2) = 0;    expected(2,3) = 0;    expected(2,4) = 1;    expected(2,5) = 1;
        expected(3,0) = 0;   expected(3,1) = 0;     expected(3,2) = 0;    expected(3,3) = 0;    expected(3,4) = 0;    expected(3,5) = 0;
        expected(4,0) = 0;   expected(4,1) = 0;     expected(4,2) = 0;    expected(4,3) = 1;    expected(4,4) = 0;    expected(4,5) = 0;
        expected(5,0) = 0;   expected(5,1) = 0;     expected(5,2) = 0;    expected(5,3) = 0;    expected(5,4) = 0;    expected(5,5) = 0;


        AdjacencyMatrix received = Converter::BoostGraphToAdjacencyMatrix(G);

        CPPUNIT_ASSERT(received == expected);
    }

    {
        BoostGraph G(0);
        AdjacencyMatrix expected(0, 0);
        AdjacencyMatrix received = Converter::BoostGraphToAdjacencyMatrix(G);

        CPPUNIT_ASSERT(received == expected);
    }

        
}

