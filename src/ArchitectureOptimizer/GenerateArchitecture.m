function ...
    [func] = ...
GenerateArchitecture(...
	fileName, ...
	data, ...
	REWRITING_COUNT)
%
%
%%%%%%%%%%
    warning('off', 'all');

    net = GenerateConnectionsMap(fileName, REWRITING_COUNT);
    net = FitArchitectureToData(net, data);

    vertexCount = size(net.connections, 2);    
    net.functions = AO_CreateFunctions(vertexCount);

    biases = AO_CreateBiases(net);
    [pLow, pUp] = AO_CreateBorders(vertexCount, biases);
    [net2, data2] = AddBiases(net, data, biases);

    
    func = [];
    func.architecture = net2;
    func.data = data2;
    func.lowBorder = pLow;
    func.upBorder  = pUp;
    func.plotData  = data;
    
return
end

