function [] = TestAdjacent()

conn = [0 0 0 1 0 1 0 0; ...
        0 0 0 0 1 0 0 0; ...
        0 0 0 0 1 0 1 0; ...
        0 0 0 0 0 1 0 1; ...
        0 0 0 0 0 0 1 1; ...
        0 0 0 0 0 0 0 1; ...
        0 0 0 0 0 0 0 1; ...
        0 0 0 0 0 0 0 0 ];
    
net.connections = conn;

res = GetAdjacentVertexes([1 2 3], net);
AssertEqual(res, [4 5 6 7]);

res = GetAdjacentVertexes([4 5], net);
AssertEqual(res, [6 7 8]);

res = GetAdjacentVertexes([8], net);
AssertEqual(res, []);

disp('Test adjacent successfull');



