function ...
    [] = ...
GenerateGraphWiz( ...
    lSystemFileName, ...
    stepsCount,...
    outFileName)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Applies L-System rules and generates the GraphWiz output.

configuration = GraphGeneratorConfiguration();
DO_LOGGING = configuration.doLogging;

toolName = 'GraphCompiler.exe';
graphFN = 'graph.txt';
compilerOutputFN = outFileName;
formatId = 'GraphWiz';
parserLogFN = 'parser.log';
compilerLogFN = 'compiler.log';

%%%%%%%%%%%%%%%%%%%%%%%%%%
if (DO_LOGGING)
  disp('Applying L-system rules...');  
end

str = LSystemRun(lSystemFileName, stepsCount);

if (DO_LOGGING)
  disp('L-system rules applied successfully...');  
end
%%%%%%%%%%%%%%%%%%%%%%%%%%
if (DO_LOGGING)
  disp('Creating graph text file...');  
end

hFile = fopen(graphFN, 'w');
fprintf(hFile, '%s', str);
fclose(hFile);

if (DO_LOGGING)
  disp('Graph text file generated successfully...');  
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
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

if (DO_LOGGING)
  disp('Generating GraphWiz data...');  
end
                            
[exitCode, stdOutput] = system(cmd);

if (DO_LOGGING)
  if (0 == exitCode)
    disp('GraphWiz data generated successfully...');
  else
    disp('GraphWiz data generation failed...');
  end
end

return
end
