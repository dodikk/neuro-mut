diary 'LargeData_Detail_Hardness_recovery_log.txt'
formatSettings = CreateFormatSettings(5);

patterns = dlmread('raw_items.csv'     , formatSettings.delimiter);
answers  = dlmread('raw_conditions.csv', formatSettings.delimiter);

patterns = patterns';
answers  = answers' ;


[nPatterns, minPatterns, maxPatterns] = premnmx(patterns);
[nAnswers , minAnswers , maxAnswers ] = premnmx(answers );



%%%%%%%%%%%%%%%EVALUATION EXPERIMENT%%%%%%%%%%%%%%%%%%%%%%
probesCount = size(patterns, 2)   ;

%%probeSize = 359; %%last chunk size
probeSize = 269; %%last chunk size
testEnd   = probesCount;
testBegin = probesCount - probeSize;


testProbe   = patterns(1:end, testBegin:testEnd);
testAnswer  = answers (1:end, testBegin:testEnd);

nTestProbe   = nPatterns(1:end, testBegin:testEnd);
nTestAnswer  = nAnswers (1:end, testBegin:testEnd);

%%%%%%%%%%%%%%%TRAINING DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
probes       = patterns(1:end, 1:testBegin - 1);
conditionsVt = answers (1:end, 1:testBegin - 1);

nProbes       = nPatterns(1:end, 1:testBegin - 1);
nConditionsVt = nAnswers (1:end, 1:testBegin - 1);





data.input    = nProbes      ;
data.expected = nConditionsVt;






loaded_net = load('net.mat');
net = loaded_net.net;

%% is it necessary ?
net = init(net);

net.trainParam.show = inf; %%No matlab logs
tic
[net, tr, Y, E, Pf, Af]= train(net, data.input, data.expected);
toc
resultArch = net;


trError = mse(E);
msgTrError = sprintf('Training error : %f', trError);
disp(msgTrError);


save('net_large.mat', 'net') 




tic
[Y, Pf, Af, E, Perf] = sim(net, nTestProbe, [], [], nTestAnswer);
toc

netAnswers = postmnmx(Y, minAnswers , maxAnswers);
netAnswer = mean(netAnswers, 2);


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




diary off


