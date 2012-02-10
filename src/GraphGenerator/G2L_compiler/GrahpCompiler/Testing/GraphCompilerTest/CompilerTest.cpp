#include "stdafx.h"
#include "CompilerTest.h"

using namespace Graph;
using namespace boost;

void CompilerTest::TestOutputs()
{
    Test1Outputs();
}

void CompilerTest::TestSelfConnected()
{
    Test1SelfConnect();
}

void CompilerTest::TestCorrupted()
{
    /*
    CPPUNIT_ASSERT(false);
        Test1Corrupted();
        Test2Corrupted();*/
    
}

void CompilerTest::Test1Outputs()
{
    std::string input = "_a:i+1+2[_c:io+1_d:o]+1-1_b:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::G2LParser parser(&inStream);
    yyparse(&parser);
    ::Graph::Graph rawGraph = parser.GetParsedData();


    CPPUNIT_ASSERT(rawGraph.size() == 3);

    {
        VertexPtr vert = rawGraph.at(0);
        CPPUNIT_ASSERT(true  == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());
    }

    
    {
        VertexPtr vert = rawGraph.at(1);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false  == vert->attr_.GetOutputFlag());
    }
    {
        VertexPtr vert = rawGraph.at(2);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());
    }
    

    CPPUNIT_ASSERT(rawGraph.at(2)->connections_.empty());

    {
        int rawConn[] = {1, 2};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );


        CPPUNIT_ASSERT(rawGraph.at(0)->connections_ == expectedConnections);
    }

    {
        int rawConn[] = {1, -1};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );


        CPPUNIT_ASSERT(rawGraph.at(1)->connections_ == expectedConnections);
    }

    {
        VertexPtr vert = rawGraph.at(1)->subgraph_.at(0);
        CPPUNIT_ASSERT(true == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true == vert->attr_.GetOutputFlag());

        CPPUNIT_ASSERT(vert->connections_.at(0) == 1);
    }

    {
        VertexPtr vert = rawGraph.at(1)->subgraph_.at(1);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());
    }
}

void CompilerTest::Test1SelfConnect()
{
    std::string input = "_a:i+1+2[_c:io+1_d:o]+1-1+0_b:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::G2LParser parser(&inStream);
    yyparse(&parser);
    ::Graph::Graph rawGraph = parser.GetParsedData();


    CPPUNIT_ASSERT(rawGraph.size() == 3);

    {
        VertexPtr vert = rawGraph.at(0);
        CPPUNIT_ASSERT(true  == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());
    }


    {
        VertexPtr vert = rawGraph.at(1);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false  == vert->attr_.GetOutputFlag());
    }
    {
        VertexPtr vert = rawGraph.at(2);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());
    }


    CPPUNIT_ASSERT(rawGraph.at(2)->connections_.empty());

    {
        int rawConn[] = {1, 2};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );


        CPPUNIT_ASSERT(rawGraph.at(0)->connections_ == expectedConnections);
    }

    {
        int rawConn[] = {1, -1, 0};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );

        Connections recievedConnections = rawGraph.at(1)->connections_;

        CPPUNIT_ASSERT(recievedConnections == expectedConnections);
    }

    {
        VertexPtr vert = rawGraph.at(1)->subgraph_.at(0);
        CPPUNIT_ASSERT(true == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true == vert->attr_.GetOutputFlag());

        CPPUNIT_ASSERT(vert->connections_.at(0) == 1);
    }

    {
        VertexPtr vert = rawGraph.at(1)->subgraph_.at(1);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());
    }
}
void CompilerTest::Test1Corrupted()
{
    CPPUNIT_ASSERT(false);
}
void CompilerTest::Test2Corrupted()
{
    CPPUNIT_ASSERT(false);
}

void CompilerTest::TestCascade()
{
    std::string input = "[_aa:io+1[_aba:io+1[_abba:io]:io]:io]:i+1_b:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::G2LParser parser(&inStream);
    yyparse(&parser);
    ::Graph::Graph rawGraph = parser.GetParsedData();

    VertexPtr a = rawGraph.at(0);
    VertexPtr b = rawGraph.at(1);

    VertexPtr aa = a->subgraph_.at(0);
    VertexPtr ab = a->subgraph_.at(1);

    VertexPtr aba = ab->subgraph_.at(0);
    VertexPtr abb = ab->subgraph_.at(1);

    VertexPtr abba = abb->subgraph_.at(0);

    CPPUNIT_ASSERT(true  == a->attr_.GetInputFlag());
    CPPUNIT_ASSERT(false == a->attr_.GetOutputFlag());

    CPPUNIT_ASSERT(false == b->attr_.GetInputFlag());
    CPPUNIT_ASSERT(true  == b->attr_.GetOutputFlag());

    CPPUNIT_ASSERT(true == aa->attr_.GetInputFlag());
    CPPUNIT_ASSERT(true == aa->attr_.GetOutputFlag());

    CPPUNIT_ASSERT(true == ab->attr_.GetInputFlag());
    CPPUNIT_ASSERT(true == ab->attr_.GetOutputFlag());

    CPPUNIT_ASSERT(true == aba->attr_.GetInputFlag());
    CPPUNIT_ASSERT(true == aba->attr_.GetOutputFlag());

    CPPUNIT_ASSERT(true == abba->attr_.GetInputFlag());
    CPPUNIT_ASSERT(true == abba->attr_.GetOutputFlag());

    CPPUNIT_ASSERT(1 == a->connections_.at(0));
    CPPUNIT_ASSERT(1 == aa->connections_.at(0));
    CPPUNIT_ASSERT(1 == aba->connections_.at(0));
    CPPUNIT_ASSERT(abba->connections_.empty());

    CPPUNIT_ASSERT(ab->connections_.empty());
    CPPUNIT_ASSERT(abb->connections_.empty());
    CPPUNIT_ASSERT(b->connections_.empty());
}

void CompilerTest::TestManySubgraphs()
{
    std::string input = "_parent:i+1+2[_left1:i+1_left2:o]:o[_right1:i+1_right2:o]:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::G2LParser parser(&inStream);
    yyparse(&parser);
    ::Graph::Graph rawGraph = parser.GetParsedData();


    CPPUNIT_ASSERT(rawGraph.size() == 3);

    {
        VertexPtr vert = rawGraph.at(0);
        CPPUNIT_ASSERT(true  == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        int rawConn[] = {1, 2};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );

        CPPUNIT_ASSERT(vert->connections_ == expectedConnections);
    }


    {
        VertexPtr vert = rawGraph.at(1);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());
    }

    {
        VertexPtr vert = rawGraph.at(2);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());
    }

    {
        VertexPtr vert = rawGraph.at(1)->subgraph_.at(0);
        CPPUNIT_ASSERT(true  == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        CPPUNIT_ASSERT(vert->connections_.at(0) == 1);
    }

    {
        VertexPtr vert = rawGraph.at(1)->subgraph_.at(1);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());

        CPPUNIT_ASSERT(vert->connections_.empty());
    }

    {
        VertexPtr vert = rawGraph.at(2)->subgraph_.at(0);
        CPPUNIT_ASSERT(true  == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        CPPUNIT_ASSERT(vert->connections_.at(0) == 1);
    }

    {
        VertexPtr vert = rawGraph.at(2)->subgraph_.at(1);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true  == vert->attr_.GetOutputFlag());

        CPPUNIT_ASSERT(vert->connections_.empty());
    }
}

void CompilerTest::TestSpiral1()
{
    std::string input = "_fInput1:i+2_fInput2:i+2_in1+2+3_in2+1+2[[_a:io_b:io_c:io_d:io_e:io]:io+1+2[_a:io_b:io_c:io_d:io_e:io]:io+1[_a:io_b:io_c:io_d:io_e:io]:io]+1_b:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::G2LParser parser(&inStream);
    yyparse(&parser);
    ::Graph::Graph rawGraph = parser.GetParsedData();


    CPPUNIT_ASSERT(rawGraph.size() == 6);

    {
        VertexPtr vert = rawGraph.at(0);
        CPPUNIT_ASSERT(true  == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        int rawConn[] = {2};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );

        CPPUNIT_ASSERT(vert->connections_ == expectedConnections);
    }


    {
        VertexPtr vert = rawGraph.at(1);
        CPPUNIT_ASSERT(true  == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        int rawConn[] = {2};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );

        CPPUNIT_ASSERT(vert->connections_ == expectedConnections);
    }

    {
        VertexPtr vert = rawGraph.at(2);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        int rawConn[] = {2, 3};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );

        CPPUNIT_ASSERT(vert->connections_ == expectedConnections);
    }

    {
        VertexPtr vert = rawGraph.at(3);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        int rawConn[] = {1, 2};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );

        CPPUNIT_ASSERT(vert->connections_ == expectedConnections);
    }

    {
        VertexPtr vert = rawGraph.at(5);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(true == vert->attr_.GetOutputFlag());
    }

    {
        VertexPtr vert = rawGraph.at(4);
        CPPUNIT_ASSERT(false == vert->attr_.GetInputFlag());
        CPPUNIT_ASSERT(false == vert->attr_.GetOutputFlag());

        int rawConn[] = {1};
        Connections expectedConnections;

        expectedConnections.assign(
            rawConn, 
            rawConn + sizeof(rawConn) / sizeof(int) );

        CPPUNIT_ASSERT(vert->connections_ == expectedConnections);
        CPPUNIT_ASSERT(vert->subgraph_.size() == 3);

        {
            VertexPtr layer = vert->subgraph_.at(0);

            CPPUNIT_ASSERT(true == layer->attr_.GetInputFlag());
            CPPUNIT_ASSERT(true == layer->attr_.GetOutputFlag());

            CPPUNIT_ASSERT(layer->subgraph_.size() == 5);

            {
                VertexPtr v0 = layer->subgraph_.at(0);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(1);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(2);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(3);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(4);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }
        }

        {
            VertexPtr layer = vert->subgraph_.at(1);

            CPPUNIT_ASSERT(true == layer->attr_.GetInputFlag());
            CPPUNIT_ASSERT(true == layer->attr_.GetOutputFlag());

            CPPUNIT_ASSERT(layer->subgraph_.size() == 5);

            {
                VertexPtr v0 = layer->subgraph_.at(0);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(1);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(2);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(3);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(4);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }
        }

        {
            VertexPtr layer = vert->subgraph_.at(2);

            CPPUNIT_ASSERT(true == layer->attr_.GetInputFlag());
            CPPUNIT_ASSERT(true == layer->attr_.GetOutputFlag());

            CPPUNIT_ASSERT(layer->subgraph_.size() == 5);

            {
                VertexPtr v0 = layer->subgraph_.at(0);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(1);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(2);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(3);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }

            {
                VertexPtr v0 = layer->subgraph_.at(4);

                CPPUNIT_ASSERT(true == v0->attr_.GetInputFlag());
                CPPUNIT_ASSERT(true == v0->attr_.GetOutputFlag());

                CPPUNIT_ASSERT(v0->connections_.empty());
            }
        }
    }
}

