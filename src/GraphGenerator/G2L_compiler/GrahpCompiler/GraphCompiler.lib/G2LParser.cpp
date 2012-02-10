#include "stdafx.h"
#include "G2LParser.h"

using namespace Parser;
using namespace Lexer;
using namespace Utilities;
using namespace Graph;

G2LParser::~G2LParser()
{
}

G2LParser::G2LParser(std::istream* stream) :
ParentClass(stream)
{
    stack_.push( ::Graph::Graph() );
}

::Graph::Graph& G2LParser::GetCurrentSubGraph()
{
    if ( stack_.empty() )
    {
        throw std::runtime_error("<GetCurrentSubGraph> : no objects specified");
    }

    return stack_.top();
}

VertexPtr G2LParser::GetGrowthPoint()
{
    ::Graph::Graph& currentSubgraph = GetCurrentSubGraph();

    if ( currentSubgraph.empty() )
    {
        throw std::runtime_error("<GetGrowthPoint> : no objects specified");
    }

    return currentSubgraph.back();
}

void G2LParser::StartSubgraph()
{
    stack_.push( ::Graph::Graph() );
}

void G2LParser::EndSubgraph()
{
    ::Graph::Graph newSubGraph = GetCurrentSubGraph();
    stack_.pop();
    GetGrowthPoint()->subgraph_ = newSubGraph;
}

void G2LParser::AppendVertex()
{
    ::Graph::Graph& currSubGraph = GetCurrentSubGraph();
    currSubGraph.push_back( VertexPtr( new Vertex() ) );
}

void G2LParser::SetVertexName()
{
    const YYSTYPE& rawData = lexer_.GetRawData();
    const char* rawString = rawData.stringValue;

    VertexPtr growthPoint = GetGrowthPoint();

    growthPoint->id_ = rawString;
}

void G2LParser::SetAttributes()
{
    const YYSTYPE& rawData = lexer_.GetRawData();
    const char* rawString = rawData.stringValue;
    std::string str = UpperCase( std::string(rawString) );

    VertexPtr growthPoint = GetGrowthPoint();

    if (std::string::npos != str.find(lexer_.INPUT_ATTR_CHAR) )
    {
        growthPoint->attr_.SetInputFlag();
    }

    if (std::string::npos != str.find(lexer_.OUTPUT_ATTR_CHAR) )
    {
        growthPoint->attr_.SetOutputFlag();
    }
}

void G2LParser::AppendConnection()
{
    VertexPtr growthPoint = GetGrowthPoint();

    const YYSTYPE& rawData = lexer_.GetRawData();
    int connection = rawData.intValue;
    
    growthPoint->connections_.push_back(connection);
}

const ::Graph::Graph& G2LParser::GetParsedData() const
{
    return stack_.top();
}
