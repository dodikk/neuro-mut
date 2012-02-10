function [] = recover(backupName, rewritingsCount)
%
%
%%%%%%%%%%%%%%

formatSettings = CreateFormatSettings(3);
patterns = dlmread('parabola.csv'  , formatSettings.delimiter);
answers  = dlmread('conditions.csv', formatSettings.delimiter);
answers = answers';
[nPatterns, minPatterns, maxPatterns] = premnmx(patterns);
[nAnswers , minAnswers , maxAnswers ] = premnmx(answers );
probesCount = size(patterns, 2)   ;
probeIndex  = probesCount         ;
testProbe   = patterns(1:end, probeIndex);
testAnswer  = answers (1:end, probeIndex);
nTestProbe   = nPatterns(1:end, probeIndex);
nTestAnswer  = nAnswers (1:end, probeIndex);
%%%%%%%%%%%%%%%TRAINING DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
probes       = patterns(1:end, 1:end-1);
conditionsVt = answers (1:end, 1:end-1);
nProbes       = nPatterns(1:end, 1:end-1);
nConditionsVt = nAnswers (1:end, 1:end-1);
data.input    = nProbes      ;
data.expected = nConditionsVt;
net = M_GenerateArchitecture(backupName, data, rewritingsCount);
[trainedNet,tr,Y,E,Pf,Af] = train(net, data.input, data.expected);
trainError = mse(E);
disp(trainError);
net = trainedNet;
save('net.mat', 'net');
[Y, Pf, Af, E, Perf] = sim(net, nTestProbe, [], [], nTestAnswer);
netAnswer = postmnmx(Y, minAnswers , maxAnswers);
received = Row2Conditions(netAnswer', formatSettings);
expected = Row2Conditions(testAnswer', formatSettings);
%% raw data to plot data
[receivedAirPlot, receivedWaterPlot] = GetPhasesPlotData(received.phases);
[expectedAirPlot, expectedWaterPlot] = GetPhasesPlotData(expected.phases);
PlotDataHardnessResults(...
expectedAirPlot  , receivedAirPlot  , ...
expectedWaterPlot, receivedWaterPlot);
msgPerf = sprintf('Error : %f', Perf);
disp(msgPerf);
disp('-------------------');
msgTExpected = sprintf(...
'Expected temperature : %f', ...
expected.startTemperature  );
msgTReceived = sprintf(...
'Received temperature : %f', ...
received.startTemperature  );
disp(msgTExpected);
disp(msgTReceived);


return
end


