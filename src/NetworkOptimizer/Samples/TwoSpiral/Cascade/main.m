function [] = main( )

diary optimizer.log
diary on

warning('off', 'all');
format long g;

CreateConfiguration();
 
fileName = 'architecture.xml';
data = CreateData();

%% If rewritingCount > 15 then it works slowly

failuresLimit = 5;
rewritingCount = 5;

[resultArchName, ...
 trainedArch, ...
 resultFunc, ...
 vtError] = OptimizeArchitecture(...
                fileName, ...
                data, ...
                failuresLimit, ...
                rewritingCount);

save 'cascade_spiral.mat' ...
     trainedArch resultFunc vtError

%%%%%%%%%%%%%%%%%%%%%
[error, outputsSignals] = SimulateNetwork(...
                            resultFunc.architecture, ...
                            trainedArch.weights, ...
                            resultFunc.data);

                            
plotData = data;
plotData.expected = outputsSignals;
%%%%%%%%%%%%%%%%%%%%%

testData = CreateTwoSpiralTestData(2);
[error, outputsSignals] = SimulateNetwork(...
                            resultFunc.architecture, ...
                            trainedArch.weights, ...
                            testData);

testData.expected = outputsSignals;
dataDelimiter = 0;


%%%%%%%%%%%%%%%%%%%%%
subplot(3, 1, 1); plot(vtError);
subplot(3, 1, 2); Draw2Spiral(plotData);
subplot(3, 1, 3); Draw2SpiralPlain(testData, dataDelimiter);


disp('Error : ');
disp(trainedArch.error);

diary off

