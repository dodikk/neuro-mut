function [] = AssertEquals( expr )
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here

if (~expr)
    disp(expr);
    disp(failed);
    error();   
else
    disp('Test passed');
end %%if

return
end
