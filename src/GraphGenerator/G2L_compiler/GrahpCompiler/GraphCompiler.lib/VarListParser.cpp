#include "stdafx.h"
#include "VarListParser.h"

//Hot fix.
#include <algorithm>

using namespace Parser;

VarListParser::VarListParser(std::istream* stream) :
ParentClass(stream)
{
}

void VarListParser::SetVertexName()
{
    const YYSTYPE& rawData = lexer_.GetRawData();
    const char* rawString = rawData.stringValue;

    std::string varName(rawString);

    if ( varNames_.end() == std::find(varNames_.begin(), varNames_.end(), varName) )
    {
        varNames_.push_back(varName);
    }
}

void VarListParser::AppendVertex()
{
}

void VarListParser::SetAttributes()
{
}

void VarListParser::AppendConnection()
{
}

void VarListParser::StartSubgraph()
{
}

void VarListParser::EndSubgraph()
{
}

const string_vt& VarListParser::GetParsedData() const
{
    return varNames_;
}
