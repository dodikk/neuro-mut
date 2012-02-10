#ifndef _A_LEXER_H_
#define _A_LEXER_H_

#include "FlexLexer.h"
#include "TokenTypes.h"

namespace Lexer
{
    class ALexer : public yyFlexLexer
    {
    public:
        virtual ~ALexer();
        explicit ALexer(istream* input = NULL, 
                        ostream* output = NULL);

        virtual const YYSTYPE& GetRawData() const = 0;

        virtual void StoreStringValue() = 0;
        virtual void StoreIntValue() = 0;
    };
}



#endif //_A_LEXER_H_