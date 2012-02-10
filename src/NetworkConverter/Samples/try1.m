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


%-------------------------------------
% создание сети
%net=newff(minmax(X),arch,[tansig_mas,{'purelin'}]);
%net=newff(X,Y,[3 3 2],[tansig_mas,{'purelin'}]);
for rt=1:1%10
    disp(rt);
    net=network;
    net.numInputs = 4;
    net.numLayers = 3;
    net.biasConnect = ones(net.numLayers,1);
    %drawNN(net);
    % inp_conn = create_inp_conn(tree1);
    % inp_conn_ones = inp_conn;
    % inp_conn_ones(find(inp_conn>0)) = 1;
    net.inputConnect= ...
	[...
		0 0 1 1; ...
		1 1 0 0; ...
		0 0 0 0 ...
	];%inp_conn_ones;
	
    net.layerConnect = ...
	[...
		0 0 0; ...
		0 0 0; ...
		1 1 0 ...
	];
	
    net.outputConnect=[0 0 1];
    net.targetConnect=[0 0 1];
    net.layers{1}.size=1;
    net.layers{2}.size=1;
    net.layers{3}.size=1;
    net.initFcn = 'initlay';
    net.performFcn = 'mse';
    net.trainFcn = 'trainlm';
%%%%%    net.divideFcn = 'dividerand';
    net.trainParam.epochs=1000;
    for it=1:net.numLayers
        net.layers{it}.initFcn='initnw';
        net.layers{it}.transferFcn='tansig';
    end;
    net.layers{end}.transferFcn='purelin';
%%%%%    net.divideParam.valRatio=0;
%%%%%    net.divideParam.testRatio=0;
%%%%%    net.divideParam.trainRatio=1;
    % net.trainParam.mu_max=1e+20;
    % net.trainParam.mu_inc=1.9;
    % net.trainParam.mu_dec=0.9;
    
	% initialize network
    net=init(net);
    save 'try1.mat' net;
	
    % [inp_conn_forQ levels ID neurons levelsn IDn]=create_inp_conn_forQ(tree1);
    % Qinit = zeros(size(inp_conn_forQ,1),numInp);
	
    % формирование начальной матрицы Qinit
    %Qinit=initQ(inp_conn_forQ,Qinit);
    %Qinit=initQ_at_random(inp_conn_forQ,Qinit);
    %Qinit=[1 0 1 0;0 1 0 1];
	
    % переопредел€ем св€зи между сло€ми
    %net=restruct_lw(neurons,levelsn,net,IDn,tree1);% делаетс€ 1 раз!!!!!, так как
	
    % алгоритм обучени€ дерева измен€ет только не нулевые св€зи
    %net0=net;
	
    % переопредел€ем св€зи входного сло€ с остальными сло€ми
    %net=restruct_iw(Qinit,levels,net,ID,tree1); % делаетс€ каждый раз, когда мен€етс€ пор€док следовани€ входов
    %drawNN(net);
	
    net.trainParam.min_grad=1e-25;
    net=train(net, X, Y);
    net_out=sim(net, X);
    % x2=mapminmax('apply',chkData(:,1:end-1)',PSx);
    % y2=mapminmax('apply',chkData(:,end)',PSy);
    
    x2 = chkData(:,1:end-1)';
    y2 = chkData(:,end)';
    
    net_out2 = sim(net,x2);
    mas(rt).tr_err=mse(Y-net_out);
    mas(rt).test_err=mse(y2-net_out2);
    mas(rt).net=net;
end;

% дл€ применени€ масштабировани€ к новым данным
% x2 = [5 2 3; 1 1 1; 6 7 3; 0 0 0]
% y2 = mapminmax('apply',x2,PS)
% x1=mapminmax('apply',trnData(:,1:end-1)',PSx);
% x2=mapminmax('apply',chkData(:,1:end-1)',PSx);
% net_out = sim(net,[x1 x2]);
% index = 125:1124;
% figure;
% net_out = mapminmax('reverse',net_out,PSy);
% plot(t(index), (x(index)),'r',t(index),net_out,'b');
% grid on;
% legend('real data','net');

