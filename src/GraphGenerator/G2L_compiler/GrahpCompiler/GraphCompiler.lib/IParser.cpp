#include "stdafx.h"
#include "IParser.h"

using namespace Parser;

IParser::~IParser()
{
}

void SetVertexName(IParser* parser)
{
    parser->SetVertexName();
}

void AppendVertex(IParser* parser)
{
    parser->AppendVertex();
}

void SetAttributes(IParser* parser)
{
    parser->SetAttributes();
}

void AppendConnection(IParser* parser)
{
    parser->AppendConnection();
}

void StartSubgraph(Parser::IParser* parser)
{
    parser->StartSubgraph();
}

void EndSubgraph(Parser::IParser* parser)
{
    parser->EndSubgraph();
}

int getLexema(void* pYyval, IParser* parserInstance)
{
    return parserInstance->GetCurrentLexema(pYyval);
}

void yyerror(char* msg, IParser* parserInstance)
{
    parserInstance->ReportError(msg);
}