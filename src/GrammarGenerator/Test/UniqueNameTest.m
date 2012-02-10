function [] = UniqueNameTest()
% Tests the GetUniqueName.m
%

upperLimit = 10^2;
names = [];

for index = 1:upperLimit
    name = GetUniqueName();
    names = [names; name];    
end

uniqueNames = unique(names, 'rows');
names = sortrows(names);

if (names == uniqueNames)
   msg = sprintf('Generated %i unique names', upperLimit);
else
   msg = sprintf('There are duplicates among %i generated names', upperLimit);  
end

disp(msg);

return
end
