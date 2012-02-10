function [] = TestConnections()

disp('TestConnections...');

net = [];



net.connections = ...
[0 1 0 1 0 0;
 0 0 0 0 1 0;
 0 0 0 0 1 1;
 0 0 0 0 0 0;
 0 0 0 1 0 0;
 0 0 0 0 0 0];

disp(net.connections);

tSortInfo = ...
[4 4 3 2 1 1; ...
 3 1 2 5 6 4]

sortedConnections = SortConnections(net, tSortInfo);
disp(sortedConnections);



disp('TestConnections ended.');

return
end
