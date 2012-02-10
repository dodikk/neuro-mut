function ...
    [ error, ...
      signal ...
    ]= ...
SimulateSingleNetworkRun(...
    architecture, ...
    weights, ...
    inputValues, ...
    expectedValues)
%Simulates the acyclic network on a single data entry.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    architecture = PreprocessArchitecture(architecture);    
    signal = InitializeSignal(architecture, inputValues);

    updatedList = architecture.inputs;
    candidateList = updatedList;
    
    while ( false == IsSubset(architecture.outputs, updatedList) )
       adjacentVertexes = GetAdjacentVertexes(candidateList, architecture);
       candidateList = union(candidateList, adjacentVertexes);
       candidateList = setdiff(candidateList, updatedList);
       
       [vertexesToUpdate, signal] = GetStableVertexes(...
                                        updatedList, ...
                                        candidateList, ...
                                        architecture, ...
                                        weights, ...
                                        signal);
       updatedList = union(updatedList, vertexesToUpdate);
    end

    error = CalculateError(signal, architecture.outputs, expectedValues);
    %%signal is up-to-date;
return
end