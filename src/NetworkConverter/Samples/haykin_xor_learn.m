function [] = haykin_xor_learn()

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


%%does not initialize
%%architecture.functions = {'hardlim', 'hardlim', 'hardlim'};

%%Initialize ok
architecture.functions = {'tansig', 'tansig', 'tansig'};

%%Initialize ok
%architecture.functions = {'softmax', 'tribas', 'satlins'};

vtLow = [0 0];
vtUp  = [1 1];

biasInfo.indexes = [1 2 3];

inputData = ...
[...
    0 0 1 1; ...
    0 1 0 1  ...
];
expected = [0 1 1 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           %%      TEST   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%Inlined iplementation%%%
    numInputs = size(architecture.inputs, 2);
    numOutputs = size(architecture.outputs, 2);

    net = network();
        
    net.numInputs = numInputs;
    net.numLayers = 3;
    net.outputConnect = [0 0 1];
    net.targetConnect = [0 0 1];
    
    net.layerConnect = architecture.connections';
    net.biasConnect = [1; 1; 1];
	net.inputConnect = [1 1; 1 1; 0 0];


    
    net.initFcn             = 'initlay';
    net.performFcn          = 'mse';
    net.trainFcn            = 'trainlm'; 
    net.trainParam.epochs   = 1000;
    %net.trainParam.show     = 1;


    
    
    for layerIndex = 1 : net.numLayers
        net.layers{layerIndex}.size = 1;
        net.layers{layerIndex}.initFcn='initnw';
        net.layers{layerIndex}.transferFcn = architecture.functions{layerIndex};
    end
    
    
    
    net = init(net);
    net.trainParam.min_grad = 1e-25;
%%%Inlined iplementation%%%




	[net, algoParams, targets, errors] = train(net, inputData, expected);

    result = sim(net, inputData);
    disp(result);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

save 'haykin_xor_learn.mat' net

return
end

