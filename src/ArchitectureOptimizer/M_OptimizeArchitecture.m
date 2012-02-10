function...
    [resultArchName, ...
     trainedArch,    ...
	 resultFunc,     ...
	 vtError] =      ...
M_OptimizeArchitecture(...
	startFileName, ...
    data, ...
	settings)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    CURRENT_ARCH_FILE_NAME   = 'result.xml';
    CANDIDATE_ARCH_FILE_NAME = 'candidate.xml';

    
    if settings.DO_LOGGING
        disp('M_OptimizeArchitecture started...');
    end

    
    startPoint = AssignGlArchitecture(...
                    CURRENT_ARCH_FILE_NAME, ...
                    startFileName);
    
    
    candidateArchName = CANDIDATE_ARCH_FILE_NAME;
    resultArchName = CURRENT_ARCH_FILE_NAME;


    disp('M_GenerateArchitecture');
	[trainedArch, perfT, perf] = M_GetBestNetOfCurrentArchitecture(...
                              resultArchName , ...
                              data           , ...
                              settings);

	vtError = [perf];
	
	failuresCounter = 0;
    loopsCount = 0;
    while (failuresCounter < settings.FAILURES_LIMIT)
        if settings.DO_LOGGING
            msg1 = sprintf('Iteration : %i', loopsCount);
            msg2 = sprintf('Failures count : %i', failuresCounter);
            
            disp(msg1);
            disp(msg2);
            
            fileName = sprintf('ArchResult%i.mat', loopsCount);
            save(fileName, 'trainedArch', 'vtError');
        end
        
        
        disp('RandomMutation');
        RandomMutation(resultArchName, candidateArchName); 
        

        disp('M_GetBestNetOfCurrentArchitecture');
        [candidateFunc, candidatePerfT, candidatePerf] = ...
            M_GetBestNetOfCurrentArchitecture( ...
                candidateArchName, data, settings);

		vtError = [vtError candidatePerf];
        
        disp('Updating architecture...');
        
        DumpTrainingResult('Candidate', candidatePerfT, candidateFunc.numLayers, candidatePerf);
        DumpTrainingResult('Best     ', perfT, trainedArch.numLayers, perf);
        
		
		if (candidatePerf < perf)
            if settings.DO_LOGGING
                disp('The candidate solution is better.');
            end
            
			resultArchName = candidateArchName;
            trainedArch    = candidateFunc    ;
            perf           = candidatePerf    ;
            perfT          = candidatePerfT   ;
            
            
            
            startPoint = AssignGlArchitecture(...
                            CURRENT_ARCH_FILE_NAME, ...
                            CANDIDATE_ARCH_FILE_NAME);
            
            failuresCounter = 0;
        else
            if settings.DO_LOGGING
                disp('The candidate solution is worse.');
            end

			failuresCounter = failuresCounter + 1;
        end
        
        loopsCount = loopsCount + 1;
        disp('==========================');
    end

    
    if settings.DO_LOGGING
        disp('M_OptimizeArchitecture ended.');
    end
    
    resultFunc = init(trainedArch);
    
return
end

