%{ 
#ifndef FLEXFIX
#define FLEXFIX YY_MyParser_STYPE *val
#define FLEXFIX2 val
#endif



// Includes
#include <string.h>   // strcpy, strncpy
#include <io.h>       // isatty

#ifdef MSVC
#define  isatty _isatty  // for some reason isatty is called _isatty in VC..
#endif

#define  _LEX_CPP_   // make sure our variables get created
#include "ALexer.h" // Make sure the flexer can communicate with bison++ 
                      //using return values


// Forward references
void StoreStringValue(yyFlexLexer* );
void StoreIntValue(yyFlexLexer* );
                      
%}

sign		[+-]
digit		[0-9]
letter		[A-Za-z]
integer		[1-9]{digit}*
whitespace  [ \r\t\n]+

id			{letter}[A-Za-z0-9]*
connection  {sign}{digit}

%%
{whitespace}   { /* no action */ }
{connection}   {  StoreIntValue(this);	  return CONNECTION; }
{id}		   {  StoreStringValue(this); return ID; }

"["			   { return LBRACKET; }
"]"            { return RBRACKET; }
":"			   { return ATTRIBUTES_HEADER; }
"_"			   { return NODE_SEPARATOR; }

<<EOF>> { yyterminate();}
%%

void StoreStringValue(yyFlexLexer* _this)
{
	Lexer::ALexer* pThis = dynamic_cast<Lexer::ALexer*>(_this);
	
	if (pThis)
	{
		pThis->StoreStringValue();
	}
}

void StoreIntValue(yyFlexLexer* _this)
{
	Lexer::ALexer* pThis = dynamic_cast<Lexer::ALexer*>(_this);

	if (pThis)
	{
		pThis->StoreIntValue();
	}
}


int yywrap()
{
        return(1);
}
