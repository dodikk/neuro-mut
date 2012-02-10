diary 'Detail_Hardness_log.txt'


formatSettings = CreateFormatSettings(1);
probes = LoadProbes('inputs.csv', formatSettings);
conditionsVt = LoadConditions('settings.csv', formatSettings);


%%%%%%%%%%%%%%%EVALUATION EXPERIMENT%%%%%%%%%%%%%%%%%%%%%%
probesCount = size(probes, 1)         ;
probeIndex  = probesCount             ;
testProbe   = probes(probeIndex)      ;
testAnswer  = conditionsVt(probeIndex);


%%%%%%%%%%%%%%%TRAINING DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
probes = probes(1, 1:end-1);
conditionsVt = conditionsVt(1, 1:end-1);






[patterns, answers] = Data2TrainingSet(probes, conditionsVt);

%%startPoint = 'minimal.xml';
startPoint = 'cascade.xml';






normalizationSettings = CreateNormalizationSettings();

    nPatterns = DH_Utils_NormalizeTrainingData( ...
        patterns                              , ...
        normalizationSettings.cutIdRange      , ...
        normalizationSettings.radiusRange     , ...
        normalizationSettings.hardnessRange   , ...
        normalizationSettings.targetRange     );
    
    
    nAnswers = DH_Utils_NormalizeAnswerData(      ...
        answers                                 , ...
        normalizationSettings.durationRange     , ...
        normalizationSettings.airPressureRange  , ...
        normalizationSettings.waterPressureRange, ...
        normalizationSettings.targetRange       );



data.input    = nPatterns';
data.expected = nAnswers' ;




settings = [];
settings.FAILURES_LIMIT    =    10;
settings.REWRITING_COUNT   =    20;
settings.NEURONS_LIMIT     =    25;
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



EvaluateProbe(...
    testProbe, testAnswer, net, ...
    normalizationSettings, formatSettings);


diary off

