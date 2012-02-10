diary 'LargeData_FNN_Detail_Hardness_log.txt'


formatSettings = CreateFormatSettings(5);


patterns = dlmread('raw_items.csv'     , formatSettings.delimiter);
answers  = dlmread('raw_conditions.csv', formatSettings.delimiter);

patterns = patterns';
answers  = answers' ;






[nPatterns, minPatterns, maxPatterns] = premnmx(patterns);
[nAnswers , minAnswers , maxAnswers ] = premnmx(answers );





%%probeSize = 6;
%%probeSize = 269; %%last chunk size
probeSize = 270; %%second chunk size


[testProbe , probes        ] = GetExamData(patterns , probeSize);
[testAnswer, conditionsVt  ] = GetExamData(answers  , probeSize);

[nTestProbe , nProbes      ] = GetExamData(nPatterns, probeSize);
[nTestAnswer, nConditionsVt] = GetExamData(nAnswers , probeSize);



data.input    = nProbes      ;
data.expected = nConditionsVt;



%%net = CreateFeedForwardNet();
net = CreateCascadeNet();


tic
net.trainParam.show = inf; %%No matlab logs
[net, tr, Y, E, Pf, Af]= train(net, data.input, data.expected);
resultArch = net;
toc


trError = mse(E);
msgTrError = sprintf('Training error : %f', trError);
disp(msgTrError);


save('net.mat', 'net');
ExamLargeData();
pause
ExamSmallData();

diary off

