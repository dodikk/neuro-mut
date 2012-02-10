function [] = tree_sample()
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%<Create data>%%%%%%%%%%%%%%%%%%
	clear
	clc
	% training set
	load mgdata.dat
	t = mgdata(:, 1); x = mgdata(:, 2);
	for t=118:1117,
		Data(t-117,:)=[x(t-18) x(t-12) x(t-6) x(t) x(t+6)];
	end
	t = mgdata(:, 1);
	trnData=Data(1:500, :);
	chkData=Data(501:end, :);
	X_old=(trnData(:,1:end-1))';
	Y_old=(trnData(:,end))';
	% масштабирование
	%%%%% [X,PSx]= mapminmax(X_old);
	%%%%% [Y,PSy]= mapminmax(Y_old);

	X = X_old;
	Y = Y_old;
%%%%%%%%%%%</Create data>%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%<CREATE NET>%%%%%%%%%%%%%%%%%%%%%%%%%%%
	architecture = [];
	biasInfo = [];

	architecture.connections = ...
	[ ...
		0 0 1 ; ...
		0 0 1 ; ...
		0 0 0   ...
	];

	architecture.inputs  = [];
	architecture.outputs = [3];

	architecture.functions = {'tansig', 'tansig', 'purelin'};

	vtLow = [];
	vtUp  = [];

	biasInfo.indexes = [1 2 3];
	net = RawNetworkToMatlabFormat(architecture, biasInfo, vtLow, vtUp);

    net.numInputs = 4;
	net.inputConnect= ...
	[...
		0 0 1 1; ...
		1 1 0 0; ...
		0 0 0 0 ...
	];%inp_conn_ones;
	
	net=init(net);
    
    save 'tree_sample.mat' net;
%%%%%%%%%%%</CREATE NET>%%%%%%%%%%%%%%%%%%%%%%%%%%%

	net=train(net, X, Y);
    net_out=sim(net, X);
    % x2=mapminmax('apply',chkData(:,1:end-1)',PSx);
    % y2=mapminmax('apply',chkData(:,end)',PSy);
    
    x2 = chkData(:,1:end-1)';
    y2 = chkData(:,end)';
    
    net_out2 = sim(net,x2);

return
end

