#include "stdafx.h"
#include "AMyParser.h"

using namespace Parser;

AMyParser::AMyParser(std::istream* stream) :
lexer_(stream)
{
}

int AMyParser::GetCurrentLexema(void*& pYyval)
{
    int tokenId = lexer_.yylex();
    pYyval = (void*)(&lexer_.GetRawData());

    return tokenId ;
}

void AMyParser::ReportError(const char* msg)
{
    log_ += std::string(msg);
    log_ += "\n";
}

const std::string& AMyParser::GetLog() const
{
    return log_;
}