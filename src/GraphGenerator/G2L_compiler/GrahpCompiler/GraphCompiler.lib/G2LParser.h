#ifndef _G2L_PARSER_H_
#define _G2L_PARSER_H_

#include "AMyParser.h"
#include "G2lLexer.h"
#include "Graph.h"
#include <stack>

namespace Parser
{
    typedef std::stack< ::Graph::Graph > SubGraphStack;

    class G2LParser : public ::Parser::AMyParser
    {
    public:
        typedef ::Parser::AMyParser ParentClass;

    public:
        G2LParser(std::istream* stream);
        virtual ~G2LParser();
        virtual void SetVertexName();
        virtual void AppendVertex();
        virtual void SetAttributes();
        virtual void AppendConnection();
        virtual void StartSubgraph();
        virtual void EndSubgraph();

    public:
        const ::Graph::Graph& GetParsedData() const;

    private:
         ::Graph::VertexPtr GetGrowthPoint();
         ::Graph::Graph& GetCurrentSubGraph();

    private:
        SubGraphStack stack_;
    };
}

#endif