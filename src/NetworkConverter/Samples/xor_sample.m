function [] = xor_sample()

architecture = [];
biasInfo = [];

architecture.connections = ...
[ ...
    0 0 1 1 1; ...
    0 0 1 1 1; ...
    0 0 0 0 1; ...
    0 0 0 0 1; ...
    0 0 0 0 0  ...
];


architecture.inputs  = [1 2];
architecture.outputs = [5];


architecture.functions = ...
{'purelin', 'purelin', 'tansig', 'tansig', 'tansig'};
%%{'purelin', 'purelin', 'hardlim', 'hardlim', 'hardlim'};


vtLow = [0 0];
vtUp  = [1 1];

biasInfo.indexes = [3 4 5];

net = RawNetworkToMatlabFormat(architecture, biasInfo, vtLow, vtUp);


inputData = ...
[...
    0 0 1 1; ...
    0 1 0 1  ...
];

expected = [0 1 1 0];

[net,tr,received,errors] = train(net, inputData, expected);

disp('received : ');
disp(received);

disp('errors :');
disp(errors);

return
end

