function [] = TestFakeVertexes()
disp('TestFakeVertexes...');

    TestSmallCascade();
    TestChain();


disp('TestFakeVertexes end.');
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = TestSmallCascade()

disp('_____TestSmallCascade...');
tSortInfo = ...
[3 2 1; ...
 1 2 3]

net.connections = ...
[ ...
  0 1 1;
  0 0 1;
  0 0 0
];

net.inputs = [1];
net.outputs = [3];

expanded = AddFakeVertexes(net, tSortInfo);
disp(expanded.connections);

%%
expected = ...
[ ...
  0 1 0 1;
  0 0 1 0;
  0 0 0 0;
  0 0 1 0
]

disp('_____TestSmallCascade end.');
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = TestChain()
disp('_____TestChain...');

tSortInfo = ...
[4 3 2 1; ...
 1 2 3 4]

net.connections = ...
[ ...
  0 1 1 1;
  0 0 1 1;
  0 0 0 1; 
  0 0 0 0
];

net.inputs = [1];
net.outputs = [4];

expanded = AddFakeVertexes(net, tSortInfo);
disp(expanded.connections);

%%
expected = ...
[ ...
  0 1 0 0    1 1 0 0;
  0 0 1 0    0 0 0 1;
  0 0 0 1    0 0 0 0;
  0 0 0 0    0 0 0 0;
  0 0 1 0    0 0 0 0;
  0 0 0 0    0 0 1 0;
  0 0 0 1    0 0 0 0;
  0 0 0 1    0 0 0 0
]


disp('_____TestChain end.');
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

