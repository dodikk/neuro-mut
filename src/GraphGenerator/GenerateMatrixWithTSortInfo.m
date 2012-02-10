function [ result ] = GenerateConnMapWithTSortInfo( input_args )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toolName = 'GraphCompiler.exe';
graphFN = 'graph.txt';
compilerOutputFN = 'graph.tsort';
formatId = 'TopoSort';
parserLogFN = 'parser.log';
compilerLogFN = 'compiler.log';

str = LSystemRun(lSystemFileName, stepsCount);
hFile = fopen(graphFN, 'w');
fprintf(hFile, '%s', str);
fclose(hFile);

%%unix('GraphCompiler.exe graph.txt graph.gv Adj.Matrix log.txt > cascade.log ')
%dos('GraphCompiler.exe graph.txt graph.mtx Adj.Matrix parser.log > compiler.log ');

[cmd, ...
 errmsg] = sprintf(...
                '%s %s %s %s %s > %s', ...
                toolName, ...
                graphFN, ...
                compilerOutputFN, ...
                formatId, ...
                parserLogFN, ...
                compilerLogFN);
                
[exitCode, stdOutput] = dos(cmd);


rawData = load(compilerOutputFN);
result = ParseMatrix(rawData);


return
end
