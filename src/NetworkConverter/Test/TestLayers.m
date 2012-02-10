function [] = TestLayers()
%
%

disp('TestLayers ...');

tSortInfo = ...
[4 4 3 2 1 1; ...
 3 1 2 5 6 4];

result = GetLayers(tSortInfo);
disp(result);


disp('TestLayers ended.');


return
end
