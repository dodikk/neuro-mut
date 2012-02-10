function [] = haykin_xor_sample2()

architecture = [];
biasInfo = [];

architecture.connections = ...
[ ...
	0 0 1 1 0; ...
	0 0 1 1 0; ...
    0 0 0 0 1; ...
    0 0 0 0 1; ...
    0 0 0 0 0  ...
];


architecture.inputs  = [1 2];
architecture.outputs = [5];


architecture.functions = {'purelin', 'purelin', 'hardlim', 'hardlim', 'hardlim'};


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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           %%      TEST %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    net.layerConnect = architecture.connections';
    net.biasConnect = [0; 0; 1; 1; 1];

    net.IW{1, 1} = 1;
    net.IW{2, 2} = 1;

    %%layer 1
	
	net.LW{3, 1} = [1];
    net.LW{3, 2} = [1];
	net.LW{4, 1} = [1];
    net.LW{4, 2} = [1];


    net.LW{5, 3} = [-2];
    net.LW{5, 4} = [1];
    
    net.b = {[]; []; [-1.5]; [-0.5]; [-0.5]};
    
    result = sim(net, inputData);
    disp(result);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

save 'haykin_xor_sample2.mat' net

return
end

