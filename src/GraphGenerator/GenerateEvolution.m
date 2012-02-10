function [] = GenerateEvolution(...
    archFileName      , ...
    minRewritingCount , ...
    maxRewritingCount , ...
    resultFileNameBase)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%

for rCount = minRewritingCount : maxRewritingCount
    resName = sprintf('%s_%i.gv', resultFileNameBase, rCount);
    GenerateGraphWiz(archFileName, rCount, resName);
end


return
end

