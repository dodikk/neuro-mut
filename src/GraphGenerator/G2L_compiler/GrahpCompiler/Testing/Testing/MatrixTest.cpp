#include "stdafx.h"
#include "MatrixTest.h"

#include <iostream>

using namespace Graph;
using namespace boost;

void MatrixTest::TestOutputs()
{
    Test1Outputs();
}

void MatrixTest::TestSelfConnected()
{
    Test1SelfConnect();
}

void MatrixTest::TestCorrupted()
{
    Test1Corrupted();
    Test2Corrupted();
}

void MatrixTest::Test1Outputs()
{
    {
        ::Graph::Graph root;

        VertexPtr a(new Vertex());
        a->id_ = "a";
        a->attr_.SetInputFlag();
        a->connections_.push_back(1);
        a->connections_.push_back(2);


        VertexPtr subgraph1(new Vertex());
        subgraph1->id_ = "sg1";
        subgraph1->attr_.SetOutputFlag();
        subgraph1->connections_.push_back(1);
        subgraph1->connections_.push_back(-1);


        VertexPtr c(new Vertex());
        c->id_ = "c";
        c->attr_.SetInputFlag();
        c->attr_.SetOutputFlag();
        c->connections_.push_back(1);

        VertexPtr d(new Vertex());
        d->id_ = "d";
        d->attr_.SetOutputFlag();

        subgraph1->subgraph_.push_back(c);
        subgraph1->subgraph_.push_back(d);



        VertexPtr b(new Vertex());
        b->id_ = "b";
        b->attr_.SetOutputFlag();

        root.push_back(a);
        root.push_back(subgraph1);
        root.push_back(b);

        ::Graph::Builder builder;
        AdjacencyMatrix recievedMatrix = builder.GetAdjacencyMatrix(root);
        AdjacencyMatrix expectedMatrix(4, 4);
        expectedMatrix(0,0) = 0;   expectedMatrix(0,1) = 1;     expectedMatrix(0,2) = 0;    expectedMatrix(0,3) = 1;
        expectedMatrix(1,0) = 1;   expectedMatrix(1,1) = 0;     expectedMatrix(1,2) = 1;    expectedMatrix(1,3) = 1;
        expectedMatrix(2,0) = 1;   expectedMatrix(2,1) = 0;     expectedMatrix(2,2) = 0;    expectedMatrix(2,3) = 1;
        expectedMatrix(3,0) = 0;   expectedMatrix(3,1) = 0;     expectedMatrix(3,2) = 0;    expectedMatrix(3,3) = 0;

        CPPUNIT_ASSERT(recievedMatrix == expectedMatrix);

        BoostGraph gr = Converter::AdjacencyMatrixToBoostGraph(recievedMatrix);
        write_graphviz(std::cout, gr);
    }
}

void MatrixTest::Test1SelfConnect()
{
    {
        ::Graph::Graph root;

        VertexPtr a(new Vertex());
        a->id_ = "a";
        a->attr_.SetInputFlag();
        a->connections_.push_back(1);
        a->connections_.push_back(2);


        VertexPtr subgraph1(new Vertex());
        subgraph1->id_ = "sg1";
        subgraph1->attr_.SetOutputFlag();
        subgraph1->connections_.push_back(1 );
        subgraph1->connections_.push_back(-1);
        subgraph1->connections_.push_back(0 );


        VertexPtr c(new Vertex());
        c->id_ = "c";
        c->attr_.SetInputFlag();
        c->attr_.SetOutputFlag();
        c->connections_.push_back(1);

        VertexPtr d(new Vertex());
        d->id_ = "d";
        d->attr_.SetOutputFlag();

        subgraph1->subgraph_.push_back(c);
        subgraph1->subgraph_.push_back(d);



        VertexPtr b(new Vertex());
        b->id_ = "b";
        b->attr_.SetOutputFlag();

        root.push_back(a);
        root.push_back(subgraph1);
        root.push_back(b);

        ::Graph::Builder builder;
        AdjacencyMatrix recievedMatrix = builder.GetAdjacencyMatrix(root);
        AdjacencyMatrix expectedMatrix(4, 4);
        expectedMatrix(0,0) = 0;   expectedMatrix(0,1) = 1;     expectedMatrix(0,2) = 0;    expectedMatrix(0,3) = 1;
        expectedMatrix(1,0) = 1;   expectedMatrix(1,1) = 1;     expectedMatrix(1,2) = 1;    expectedMatrix(1,3) = 1;
        expectedMatrix(2,0) = 1;   expectedMatrix(2,1) = 1;     expectedMatrix(2,2) = 0;    expectedMatrix(2,3) = 1;
        expectedMatrix(3,0) = 0;   expectedMatrix(3,1) = 0;     expectedMatrix(3,2) = 0;    expectedMatrix(3,3) = 0;

        CPPUNIT_ASSERT(recievedMatrix == expectedMatrix);

        BoostGraph gr = Converter::AdjacencyMatrixToBoostGraph(recievedMatrix);
        write_graphviz(std::cout, gr);
    }
}

void MatrixTest::Test1Corrupted()
{
    ::Graph::Graph root;

    VertexPtr a(new Vertex());
    a->id_ = "a";
    a->attr_.SetInputFlag();
    a->connections_.push_back(1);
    a->connections_.push_back(2);
    a->connections_.push_back(3);


    VertexPtr subgraph1(new Vertex());
    subgraph1->id_ = "sg1";
    subgraph1->attr_.SetOutputFlag();
    subgraph1->connections_.push_back(1);
    subgraph1->connections_.push_back(-1);


    VertexPtr c(new Vertex());
    c->id_ = "c";
    c->attr_.SetInputFlag();
    c->attr_.SetOutputFlag();
    c->connections_.push_back(1);

    VertexPtr d(new Vertex());
    d->id_ = "d";
    d->attr_.SetOutputFlag();

    subgraph1->subgraph_.push_back(c);
    subgraph1->subgraph_.push_back(d);



    VertexPtr b(new Vertex());
    b->id_ = "b";
    b->attr_.SetOutputFlag();

    root.push_back(a);
    root.push_back(subgraph1);
    root.push_back(b);

    ::Graph::Builder builder;
    CPPUNIT_ASSERT_THROW(builder.GetAdjacencyMatrix(root), std::exception);
}
void MatrixTest::Test2Corrupted()
{
    ::Graph::Graph root;

    VertexPtr a(new Vertex());
    a->id_ = "a";
    a->attr_.SetInputFlag();
    a->connections_.push_back(1);
    a->connections_.push_back(2);
    a->connections_.push_back(-1);


    VertexPtr subgraph1(new Vertex());
    subgraph1->id_ = "sg1";
    subgraph1->attr_.SetOutputFlag();
    subgraph1->connections_.push_back(1);
    subgraph1->connections_.push_back(-1);


    VertexPtr c(new Vertex());
    c->id_ = "c";
    c->attr_.SetInputFlag();
    c->attr_.SetOutputFlag();
    c->connections_.push_back(1);

    VertexPtr d(new Vertex());
    d->id_ = "d";
    d->attr_.SetOutputFlag();

    subgraph1->subgraph_.push_back(c);
    subgraph1->subgraph_.push_back(d);



    VertexPtr b(new Vertex());
    b->id_ = "b";
    b->attr_.SetOutputFlag();

    root.push_back(a);
    root.push_back(subgraph1);
    root.push_back(b);

    ::Graph::Builder builder;
    CPPUNIT_ASSERT_THROW(builder.GetAdjacencyMatrix(root), std::exception);
}

void MatrixTest::TestCascade()
{
    ::Graph::Graph root;    

    VertexPtr a(new Vertex());
    a->id_ = "a";
    a->attr_.SetInputFlag();
    a->attr_.SetOutputFlag();
    a->connections_.push_back(1);

    VertexPtr b(new Vertex());
    b->id_ = "b";
    b->attr_.SetOutputFlag();

    root.push_back(a);
    root.push_back(b);
///////////////////////////
    VertexPtr aa(new Vertex());
    aa->id_ = "aa";
    aa->attr_.SetInputFlag();
    aa->attr_.SetOutputFlag();
    aa->connections_.push_back(1);

    VertexPtr ab(new Vertex());
    ab->id_ = "ab";
    ab->attr_.SetInputFlag();
    ab->attr_.SetOutputFlag();

    a->subgraph_.push_back(aa);
    a->subgraph_.push_back(ab);
///////////////////////////
    VertexPtr aba(new Vertex());
    aba->id_ = "aba";
    aba->attr_.SetInputFlag();
    aba->attr_.SetOutputFlag();
    aba->connections_.push_back(1);

    VertexPtr abb(new Vertex());
    abb->id_ = "abb";
    abb->attr_.SetInputFlag();
    abb->attr_.SetOutputFlag();
    
    ab->subgraph_.push_back(aba);
    ab->subgraph_.push_back(abb);
///////////////////////////
    VertexPtr abba(new Vertex());
    abba->id_ = "abba";
    abba->attr_.SetInputFlag();
    abba->attr_.SetOutputFlag();
    abba->connections_.push_back(1);

    VertexPtr abbb(new Vertex());
    abbb->id_ = "abbb";
    abbb->attr_.SetInputFlag();
    abbb->attr_.SetOutputFlag();

    abb->subgraph_.push_back(abba);
    abb->subgraph_.push_back(abbb);
///////////////////////////

    ::Graph::Builder builder;
    AdjacencyMatrix recievedMatrix = builder.GetAdjacencyMatrix(root);
    AdjacencyMatrix expectedMatrix(5, 5);
    expectedMatrix(0,0) = 0;   expectedMatrix(0,1) = 1;     expectedMatrix(0,2) = 1;    expectedMatrix(0,3) = 1; expectedMatrix(0,4) = 1;
    expectedMatrix(1,0) = 0;   expectedMatrix(1,1) = 0;     expectedMatrix(1,2) = 1;    expectedMatrix(1,3) = 1; expectedMatrix(1,4) = 1;
    expectedMatrix(2,0) = 0;   expectedMatrix(2,1) = 0;     expectedMatrix(2,2) = 0;    expectedMatrix(2,3) = 1; expectedMatrix(2,4) = 1;
    expectedMatrix(3,0) = 0;   expectedMatrix(3,1) = 0;     expectedMatrix(3,2) = 0;    expectedMatrix(3,3) = 0; expectedMatrix(3,4) = 1;
    expectedMatrix(4,0) = 0;   expectedMatrix(4,1) = 0;     expectedMatrix(4,2) = 0;    expectedMatrix(4,3) = 0; expectedMatrix(4,4) = 0;

    CPPUNIT_ASSERT(recievedMatrix == expectedMatrix);

    BoostGraph gr = Converter::AdjacencyMatrixToBoostGraph(recievedMatrix);
    write_graphviz(std::cout, gr);
}

void MatrixTest::TestManySubgraphs()
{
    ::Graph::Graph root;

    VertexPtr parent(new Vertex());
    parent->id_ = "parent";
    parent->attr_.SetInputFlag();
    parent->connections_.push_back(1);
    parent->connections_.push_back(2);
////////////////////////////////////////////
    VertexPtr left1(new Vertex());
    left1->id_ = "left1";
    left1->attr_.SetInputFlag();
    left1->connections_.push_back(1);

    VertexPtr left2(new Vertex());
    left2->id_ = "left2";
    left2->attr_.SetOutputFlag();

    VertexPtr left(new Vertex());
    left->id_ = "left";
    left->attr_.SetOutputFlag();

    left->subgraph_.push_back(left1);
    left->subgraph_.push_back(left2);
///////////////////////////////////////////////////
    VertexPtr right1(new Vertex());
    right1->id_ = "right1";
    right1->attr_.SetInputFlag();
    right1->connections_.push_back(1);

    VertexPtr right2(new Vertex());
    right2->id_ = "right2";
    right2->attr_.SetOutputFlag();

    VertexPtr right(new Vertex());
    right->id_ = "right";
    right->attr_.SetOutputFlag();

    right->subgraph_.push_back(right1);
    right->subgraph_.push_back(right2);
//////////////////////////////////////////
    root.push_back(parent);
    root.push_back(left);
    root.push_back(right);
//////////////////////////////////////////

    ::Graph::Builder builder;
    AdjacencyMatrix recievedMatrix = builder.GetAdjacencyMatrix(root);
    AdjacencyMatrix expectedMatrix(5, 5);
    expectedMatrix(0,0) = 0;   expectedMatrix(0,1) = 1;     expectedMatrix(0,2) = 0;    expectedMatrix(0,3) = 1;  expectedMatrix(0,4) = 0;
    expectedMatrix(1,0) = 0;   expectedMatrix(1,1) = 0;     expectedMatrix(1,2) = 1;    expectedMatrix(1,3) = 0;  expectedMatrix(1,4) = 0;
    expectedMatrix(2,0) = 0;   expectedMatrix(2,1) = 0;     expectedMatrix(2,2) = 0;    expectedMatrix(2,3) = 0;  expectedMatrix(2,4) = 0;
    expectedMatrix(3,0) = 0;   expectedMatrix(3,1) = 0;     expectedMatrix(3,2) = 0;    expectedMatrix(3,3) = 0;  expectedMatrix(3,4) = 1;
    expectedMatrix(4,0) = 0;   expectedMatrix(4,1) = 0;     expectedMatrix(4,2) = 0;    expectedMatrix(4,3) = 0;  expectedMatrix(4,4) = 0;
    CPPUNIT_ASSERT(recievedMatrix == expectedMatrix);

    BoostGraph gr = Converter::AdjacencyMatrixToBoostGraph(recievedMatrix);
    write_graphviz(std::cout, gr);
}



void MatrixTest::TestSpiral1()
{
    std::cout << "This test depends on CompilerTest::TestSpiral1";

    std::string input = "_fInput1:i+2_fInput2:i+2_in1+2+3_in2+1+2[[_a:io_b:io_c:io_d:io_e:io]:io+1+2[_a:io_b:io_c:io_d:io_e:io]:io+1[_a:io_b:io_c:io_d:io_e:io]:io]+1_b:o";

    std::istrstream inStream(input.c_str(), input.size());

    Parser::G2LParser parser(&inStream);
    yyparse(&parser);
    ::Graph::Graph rawGraph = parser.GetParsedData();


    ::Graph::Builder builder;
    AdjacencyMatrix recievedMatrix = builder.GetAdjacencyMatrix(rawGraph);


    const int rawExpected[20][20] = 
    {
        0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
        0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
        0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };
    AdjacencyMatrix expectedMatrix(20, 20);

    for (size_t i = 0; i < 20; ++i)
        for (size_t j = 0; j < 20; ++j)
        {
            expectedMatrix(i, j) = rawExpected[i][j];
        }
    

    CPPUNIT_ASSERT(recievedMatrix == expectedMatrix);

    BoostGraph gr = Converter::AdjacencyMatrixToBoostGraph(recievedMatrix);
    write_graphviz(std::cout, gr);
}