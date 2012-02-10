function [] = haykin_xor_sample()

architecture = [];
biasInfo = [];

architecture.connections = ...
[ ...
    0 0 1; ...
    0 0 1; ...
    0 0 0  ...
];


architecture.inputs  = [1 2];
architecture.outputs = [3];


architecture.functions = {'hardlim', 'hardlim', 'hardlim'};


vtLow = [0 0];
vtUp  = [1 1];

biasInfo.indexes = [1 2 3];
%%net = RawNetworkToMatlabFormat(architecture, biasInfo, vtLow, vtUp);

inputData = ...
[...
    0 0 1 1; ...
    0 1 0 1  ...
];
expected = [0 1 1 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           %%      TEST %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%Inlined iplementation%%%
    numInputs = size(architecture.inputs, 2);
    numOutputs = size(architecture.outputs, 2);

    net = network();
    
    net.numInputs = numInputs;
    net.numLayers = 3;
    net.outputConnect = [0 0 1];
    net.targetConnect = [0 0 1];
    
    
    for layerIndex = 1 : net.numLayers
        net.layers{layerIndex}.size = 1;
        net.layers{layerIndex}.initFcn='initnw';
        net.layers{layerIndex}.transferFcn = architecture.functions{layerIndex};
    end
%%%Inlined iplementation%%%


    net.layerConnect = architecture.connections';
    net.biasConnect = [1; 1; 1];



    net.inputConnect = [1 1; 1 1; 0 0];
    net.IW{1, 1} = 1;
    net.IW{1, 2} = 1;
    net.IW{2, 1} = 1;
    net.IW{2, 2} = 1;

    %%layer 1
    net.LW{3, 1} = [-2];
    net.LW{3, 2} = [1];
    
    net.b = {[-1.5]; [-0.5]; [-0.5]};
    
    result = sim(net, inputData);
    disp(result);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

save 'haykin_xor_sample.mat' net

return
end

