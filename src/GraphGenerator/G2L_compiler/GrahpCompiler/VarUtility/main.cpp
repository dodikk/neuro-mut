// VarUtility.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

int main(int argc, char** argv)
{
    const int ERR_SUCCESS = 0;
    const int ERR_EXCEPTION = 1;
    const int ERR_PARAMS = -1;

    try
    {
        const int requiredParamsCount = 2;

        if (argc < requiredParamsCount + 1)
        {
            return ERR_PARAMS;
        }

        std::string input = IO::ReadInputFile(argv[1]);
        std::istrstream inStream(input.c_str(), input.size());
        Parser::VarListParser parser(&inStream);
        yyparse(&parser);
        string_vt vertexNames = parser.GetParsedData();
        IO::WriteStrings(argv[2], vertexNames);

        return ERR_SUCCESS;
    }
    catch(...)
    {
        return ERR_EXCEPTION;
    }
}

