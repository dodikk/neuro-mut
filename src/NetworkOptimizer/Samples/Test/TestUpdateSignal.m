function [] = TestUpdateSignal()

conn = [0 1 1; 0 0 1; 0 0 0];
weights = [1 1 1; 1 1 1; 1 1 1];
funcs = [@Linear, @Linear, @Linear];

net.connections = conn;
net.functions = funcs;

signal = [5 17 inf];
deps = [1 2];
candidate = 3;

resSignal = UpdateVertexSignal( ...
                candidate, ...
                deps, ...
                net, ...
                weights, ...
                signal);
            
AssertEqual(resSignal, [5 17 22]);

disp('Test update signal successfull');
