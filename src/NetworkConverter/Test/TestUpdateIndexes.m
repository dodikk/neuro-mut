function [] = TestUpdateIndexes()
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('TestUpdateIndexes...');

net = [];

indexes = [1 2 3 4 5 6]

tSortInfo = ...
[4 4 3 2 1 1; ...
 3 1 2 5 6 4]

updatedIndexes = UpdateIndexes(indexes, tSortInfo);
disp(updatedIndexes);


disp('TestUpdateIndexes end.');

return
end
