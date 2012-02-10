#ifndef _VAR_LIST_PARSER_H_
#define _VAR_LIST_PARSER_H_

#include "AMyParser.h"
#include "G2lLexer.h"

namespace Parser
{
    class VarListParser : public AMyParser
    {
    public:
        typedef ::Parser::AMyParser ParentClass;

    public:
        VarListParser(std::istream* stream);
        virtual void SetVertexName();
        virtual void AppendVertex();
        virtual void SetAttributes();
        virtual void AppendConnection();
        virtual void StartSubgraph();
        virtual void EndSubgraph();

    public:
        const string_vt& GetParsedData() const;

    private:
        string_vt varNames_;
    };
}

#endif //_VAR_LIST_PARSER_H_