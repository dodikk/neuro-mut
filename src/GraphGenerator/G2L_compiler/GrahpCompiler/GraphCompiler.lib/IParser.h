#ifndef _I_PARSER_H_
#define _I_PARSER_H_

namespace Parser
{
    class IParser
    {
    public:
        virtual ~IParser();

    public:
        virtual void SetVertexName() = 0;
        virtual void AppendVertex() = 0;
        virtual void SetAttributes() = 0;
        virtual void AppendConnection() = 0;
        virtual void StartSubgraph() = 0;
        virtual void EndSubgraph() = 0;

    public:
        virtual int GetCurrentLexema(void*& yyval) = 0;
        virtual void ReportError(const char* msg) = 0;
    };
}

//typedef Parser::IParser IParser;

void SetVertexName(Parser::IParser* parser);
void AppendVertex(Parser::IParser* parser);
void SetAttributes(Parser::IParser* parser);
void AppendConnection(Parser::IParser* parser);
void StartSubgraph(Parser::IParser* parser);
void EndSubgraph(Parser::IParser* parser);

int yyparse(Parser::IParser* ); //Defined in the aparser.cpp
int getLexema(void* pYyval, Parser::IParser* parserInstance);
void yyerror(char* msg, Parser::IParser* parserInstance);

#endif
