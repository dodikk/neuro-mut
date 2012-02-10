@echo off

rem *** Run Bison to generate the parser
echo bison --no-lines --defines --verbose -o %~nx2 %~nx1 
bison  --no-lines --defines --verbose -o %~nx2 %~nx1 


rem *********************************************************************
rem *********************************************************************
rem *** Run an old parser generator to preserve the calling conversions. 
rem *** !!!!!!! HOT FIX !!!!!! ***
rem *********************************************************************


bison1  --no-lines --defines --verbose -o %~nx2 %~nx1


Rename parse.cpp.h to lexsymb.h
if exist %3 del %3
ren %2.h %3


:End
