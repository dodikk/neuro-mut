#ifndef _G2L_LEXER_H_
#define _G2L_LEXER_H_

#include "ALexer.h"
#include "UnionWrapper.h"

namespace Lexer
{
    class G2lLexer : public ALexer
    {
    public:
        typedef ALexer ParentClass;

    public:
        virtual ~G2lLexer();
        explicit G2lLexer(istream* input = NULL, 
                          ostream* output = NULL);

        virtual const YYSTYPE& GetRawData() const;

        virtual void StoreStringValue();
        virtual void StoreIntValue();

    private:
        const char* GetText() const;        
        void ReassignYYVal(const char* szText);

    private:
        Common::UnionWrapper core_;

    public:
        const char ATTRIBUTES_HEADER_CHAR;
        const char NODE_SEPARATOR_CHAR   ;
        const char SUBGRAPH_START_CHAR   ;
        const char SUBGRAPH_END_CHAR     ;
        const char INPUT_ATTR_CHAR       ;
        const char OUTPUT_ATTR_CHAR      ;
    };
}

#endif //_G2L_LEXER_H_