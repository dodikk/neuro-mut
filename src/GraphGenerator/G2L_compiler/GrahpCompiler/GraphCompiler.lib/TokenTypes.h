/*
#ifndef CONNECTION
    #include "AParser.h"
#endif*/

#ifndef __TOKEN_TYPES_H_
#define __TOKEN_TYPES_H_

#include "AParser.hpp"

namespace Lexer
{
    enum TokenTypes
    {
        TTUnknown = 0,
        TTConnection = CONNECTION,
        TTId = ID,
        TTLbracket = LBRACKET,
        TTRbracket = RBRACKET,
        TTAttributesHeader = ATTRIBUTES_HEADER,
        TTNodeSeparator = NODE_SEPARATOR,
    };
}

#endif //__TOKEN_TYPES_H_