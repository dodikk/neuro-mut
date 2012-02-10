warning('off', 'all');
format long g;
load 'cascade_spiral.mat'

[error, outputsSignals] = SimulateNetwork(...
                            resultFunc.architecture, ...
                            trainedArch.weights, ...
                            resultFunc.data);
                        
                            
plotData = resultFunc.data;
plotData.expected = outputsSignals;
%%%%%%%%%%%%%%%%%%%%%

[testData, testPlotData] = CreateTwoSpiralTestData(2);
[error, outputsSignals] = SimulateNetwork(...
                            resultFunc.architecture, ...
                            trainedArch.weights, ...
                            testData);


testPlotData.expected = outputsSignals;
dataDelimiter = 0;

save 'cascade_spiral.mat' outputsSignals
%%%%%%%%%%%%%%%%%%%%%
%subplot(3, 1, 1); plot(vtError);
%subplot(3, 1, 2); Draw2Spiral(plotData);
%subplot(3, 1, 3); 
Draw2SpiralPlain(testPlotData, dataDelimiter);
