diary 'Items_Experiment_Detail_Hardness_log.txt'


formatSettings = CreateFormatSettings(4);

patterns = dlmread('items.csv', formatSettings.delimiter);
answers  = dlmread('item_conditions.csv'      , formatSettings.delimiter);

patterns = patterns';
answers  = answers' ;



%%startPoint = 'minimal.xml';
startPoint = 'cascade.xml';


[nPatterns, minPatterns, maxPatterns] = premnmx(patterns);
[nAnswers , minAnswers , maxAnswers ] = premnmx(answers );



%%%%%%%%%%%%%%%EVALUATION EXPERIMENT%%%%%%%%%%%%%%%%%%%%%%
probesCount = size(patterns, 2)   ;

probeSize = 6;
[testProbe , probes        ] = GetExamData(patterns , probeSize);
[testAnswer, conditionsVt  ] = GetExamData(answers  , probeSize);

[nTestProbe , nProbes      ] = GetExamData(nPatterns, probeSize);
[nTestAnswer, nConditionsVt] = GetExamData(nAnswers , probeSize);



data.input    = nProbes      ;
data.expected = nConditionsVt;




settings = [];
settings.FAILURES_LIMIT    =    10;
settings.REWRITING_COUNT   =    20;
settings.NEURONS_LIMIT     =    50;
settings.LEARN_TRIES_COUNT =     1;
settings.ACCEPTABLE_ERROR  = 10^-4;
settings.MIN_ERROR_DIFF    = 10^-4;
settings.DO_LOGGING        =  true; 
settings.TRAINING_PERCENT  =  0.80;


%% TODO : remove the stub
% % net = M_GenerateArchitecture(startPoint, data, 2);    
% % resultArch = net;


[resultArchName  , ...
 net             , ...
 resultArch      , ...
 vtError] = M_OptimizeArchitecture( ...
					  startPoint  , ...
					  data        , ...
					  settings);


save('result.mat', 'resultArch');
save('net.mat', 'net') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ExamData('items.csv', 'item_conditions.csv', probeSize);


diary off

