#include "stdafx.h"
#include "G2lLexer.h"

using namespace Lexer;

G2lLexer::G2lLexer(istream* input, ostream* output):
ParentClass(input,output),
SUBGRAPH_START_CHAR('['),
SUBGRAPH_END_CHAR(']'),
ATTRIBUTES_HEADER_CHAR(':'),
NODE_SEPARATOR_CHAR('_'),
INPUT_ATTR_CHAR('I'),
OUTPUT_ATTR_CHAR('O')
{
}

G2lLexer::~G2lLexer()
{
}

const YYSTYPE& G2lLexer::GetRawData() const
{
    return core_.GetRawData();
}

const char* G2lLexer::GetText() const
{ 
    return yytext;
}

void G2lLexer::StoreStringValue()
{
    core_.SetAnsiStringValue( GetText() );
}

void G2lLexer::StoreIntValue()
{
    int value = atoi( GetText() );
    core_.SetIntValue( value );
}

