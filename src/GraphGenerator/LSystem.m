%class Rule
%{
%   string before;
%   string after;
%};

%class LSystem
%{
%   Rule* rules;//array
%   string axiom;
%};

