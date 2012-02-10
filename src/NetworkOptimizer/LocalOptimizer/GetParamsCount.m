function [ result ] = GetParamsCount(localOptimizer)
%
%
%%%%%%%%%%%%%%%%%%%5

conn = localOptimizer.func.architecture.connections;
result = size(find((conn > 0) | (conn < 0)), 1);

return
end
