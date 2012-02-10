diary 'LargeData_Detail_Hardness_log.txt'


formatSettings = CreateFormatSettings(5);


patterns = dlmread('raw_items.csv'     , formatSettings.delimiter);
answers  = dlmread('raw_conditions.csv', formatSettings.delimiter);

patterns = patterns';
answers  = answers' ;



%%startPoint = 'minimal.xml';
startPoint = 'cascade.xml';


[nPatterns, minPatterns, maxPatterns] = premnmx(patterns);
[nAnswers , minAnswers , maxAnswers ] = premnmx(answers );



%%%%%%%%%%%%%%%EVALUATION EXPERIMENT%%%%%%%%%%%%%%%%%%%%%%
%%probeSize = 359; %%full data last chunk size
probeSize = 269; %%last chunk size



[testProbe , probes        ] = GetExamData(patterns , probeSize);
[testAnswer, conditionsVt  ] = GetExamData(answers  , probeSize);

[nTestProbe , nProbes      ] = GetExamData(nPatterns, probeSize);
[nTestAnswer, nConditionsVt] = GetExamData(nAnswers , probeSize);



data.input    = nProbes      ;
data.expected = nConditionsVt;


settings = [];
settings.FAILURES_LIMIT    =     5;
settings.REWRITING_COUNT   =    20;
settings.NEURONS_LIMIT     =    25;
settings.LEARN_TRIES_COUNT =     1;
settings.ACCEPTABLE_ERROR  = 10^-4;
settings.MIN_ERROR_DIFF    = 10^-4;
settings.DO_LOGGING        =  true; 
settings.TRAINING_PERCENT  =  0.75;


%% TODO : remove the stub
% % net = M_GenerateArchitecture(startPoint, data, 2);
% % resultArch = net;


tic
net = M_GenerateArchitecture(startPoint, data, 25);
toc

tic
net.trainParam.show = inf; %%No matlab logs
[net, tr, Y, E, Pf, Af]= train(net, data.input, data.expected);
resultArch = net;
toc


trError = mse(E);
msgTrError = sprintf('Training error : %f', trError);
disp(msgTrError);


% % % [resultArchName  , ...
% % %  net             , ...
% % %  resultArch      , ...
% % %  vtError] = M_OptimizeArchitecture( ...
% % % 					  startPoint  , ...
% % % 					  data        , ...
% % % 					  settings);


save('result.mat', 'resultArch');
save('net.mat', 'net') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ExamLargeData();
pause
ExamSmallData();


diary off

