function [] = TestAdjacentSingle()

conn = [0 1 1; 0 0 1; 0 0 0];
net.connections = conn;

res = GetAdjacentVertexesSingle(1, net);
AssertEqual(res, [2 3]);

res = GetAdjacentVertexesSingle(2, net);
AssertEqual(res, [3]);

res = GetAdjacentVertexesSingle(3, net);
AssertEqual(res, []);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

conn = [0 1 1; 0 1 1; 0 0 0];
net.connections = conn;

res = GetAdjacentVertexesSingle(2, net);
AssertEqual(res, [2 3]);

disp('Test adjacent single successfull');
