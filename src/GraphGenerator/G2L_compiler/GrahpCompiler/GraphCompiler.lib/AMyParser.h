#ifndef _A_MY_PARSER_H_
#define _A_MY_PARSER_H_

#include "Types.h"
#include "IParser.h"
#include "G2lLexer.h"

namespace Parser
{
    class AMyParser : public IParser
    {
    public:
        AMyParser(std::istream* stream);

    public:
        virtual void SetVertexName() = 0;
        virtual void AppendVertex() = 0;
        virtual void SetAttributes() = 0;
        virtual void AppendConnection() = 0;
        virtual void StartSubgraph() = 0;
        virtual void EndSubgraph() = 0;

    public:
        virtual int GetCurrentLexema(void*& pYyval);
        virtual void ReportError(const char* msg);

    public:
        const std::string& GetLog() const;

    protected:
        Lexer::G2lLexer lexer_;
        std::string log_;
    };
}

#endif