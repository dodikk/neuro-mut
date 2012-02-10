function ...
    [result] = ...
M_GenerateArchitecture(...
	fileName, ...
	data	, ...
	REWRITING_COUNT)
%
%
%%%%%%%%%%%%%%%%%%%%%%%

	warning('off', 'all');

    architecture = GenerateConnectionsMap(fileName, REWRITING_COUNT);
    architecture = M_FitArchitectureToData(architecture, data); 

    vertexCount = size(architecture.connections, 2);
    architecture.functions = AO_CreateFunctions_String(vertexCount);
    biases = AO_CreateBiases(architecture);

	%% Create borders
    low = ones(vertexCount) * (-10);
    up  = ones(vertexCount) * (+10);


	result = RawNetworkToMatlabFormat( ...
		architecture , ...
		biases       , ...
		low 		 , ...
		up    		   ...
	);

	%% return result

return
end

	
