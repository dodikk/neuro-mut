function [] = ExamData(itemsFileName, conditionsFileName, probeSize)
%
%
%%%%%%%%%%%%%%

	formatSettings = CreateFormatSettings(5);

	patterns = dlmread(itemsFileName     , formatSettings.delimiter);
	answers  = dlmread(conditionsFileName, formatSettings.delimiter);

	patterns = patterns';
	answers  = answers' ;



	[nPatterns, minPatterns, maxPatterns] = premnmx(patterns);
	[nAnswers , minAnswers , maxAnswers ] = premnmx(answers );



	%%%%%%%%%%%%%%%EVALUATION EXPERIMENT%%%%%%%%%%%%%%%%%%%%%%
	probesCount = size(patterns, 2);

	[testProbe , probes        ] = GetExamData(patterns , probeSize);
    [testAnswer, conditionsVt  ] = GetExamData(answers  , probeSize);

	[nTestProbe , nProbes      ] = GetExamData(nPatterns, probeSize);
	[nTestAnswer, nConditionsVt] = GetExamData(nAnswers , probeSize);


	loaded_net = load('net.mat');
	net = loaded_net.net;


	tic
	[Y, Pf, Af, E, Perf] = sim(net, nTestProbe, [], [], nTestAnswer);
	toc

	netAnswers = postmnmx(Y, minAnswers , maxAnswers);
	netAnswer = mean(netAnswers, 2);


    testAnswerSingle = testAnswer(1:end, 1);
	received = Row2Conditions(netAnswer', formatSettings);
	expected = Row2Conditions(testAnswerSingle', formatSettings);
    
    
	%% raw data to plot data
	[receivedAirPlot, receivedWaterPlot] = GetPhasesPlotData(received.phases);
	[expectedAirPlot, expectedWaterPlot] = GetPhasesPlotData(expected.phases);

	PlotDataHardnessResults(...
		expectedAirPlot  , receivedAirPlot  , ...
		expectedWaterPlot, receivedWaterPlot);


    

	msgPerf = sprintf('Error : %f', Perf);
	disp(msgPerf);
    
   
    nnNetAnswer  = NormalizeSingle(netAnswer       , minAnswers, maxAnswers);
    nnTestAnswer = NormalizeSingle(testAnswerSingle, minAnswers, maxAnswers);
    
    
    nDiff = mse(nnNetAnswer - nnTestAnswer);
    msgDiff = sprintf('Result Difference : %f', nDiff);
    disp(msgDiff);
	disp('-------------------');

	msgTExpected = sprintf(...
		'Expected temperature : %f', ...
		expected.startTemperature  );

	msgTReceived = sprintf(...
		'Received temperature : %f', ...
		received.startTemperature  );


	disp(msgTExpected);
	disp(msgTReceived);

    
    disp('Expected : ');
    disp(testAnswerSingle');
% %     disp(nnNetAnswer');
    
    
    disp('Received : ');
    disp(netAnswer');
% %     disp(nnTestAnswer');
    
    disp('===============================================');

return
end
