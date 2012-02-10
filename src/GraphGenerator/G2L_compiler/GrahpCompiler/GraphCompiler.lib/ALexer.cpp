#include "stdafx.h"
#include "ALexer.h"

using namespace Lexer;

ALexer::~ALexer()
{
}

ALexer::ALexer(istream* input, ostream* output) :
yyFlexLexer(input, output)
{
}
