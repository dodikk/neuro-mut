function [ sortedNet ] = SortNetwork( net,  tSortInfo)
% Sorts the NET in the order, listed in the SORT_INFO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%net.connections
%%net.inputs
%%net.outputs

%%%% TSortInfo(1, :) - weights.
%%%% TSortInfo(2, :) - vertexIndexes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sortedNet.connections = SortConnections(net.connections, tSortInfo);
sortedNet.inputs      = UpdateIndexes(net.inputs, tSortInfo);
sortedNet.outputs     = UpdateIndexes(net.outputs, tSortInfo);


return
end
