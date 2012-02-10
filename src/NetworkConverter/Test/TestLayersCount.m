function [ ] = TestLayersCount( )
%
%

disp('TestLayersCount...');

tSortInfo = ...
[4 4 3 2 1 1; ...
 3 1 2 5 6 4];

result = GetLayersCount(tSortInfo);
AssertEqual(4, result);


resEmpty = GetLayersCount([]);
AssertEqual(0, resEmpty);

disp('TestLayersCount successfull.');

return
end
