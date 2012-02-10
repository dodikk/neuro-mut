function...
    [resultArchName, ...
     trainedArch, ...
     resultFunc, ...
     vtError] = ...
OptimizeArchitecture(...
    startFileName, ...
    data, ...
	FAILURES_LIMIT, ...
	REWRITING_COUNT) 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
    config = NetworkOptimizerConfiguration();
    DO_LOGGING = config.doLogging;

    %CreateNetworkOptimizerConfiguration();

    CURRENT_ARCH_FILE_NAME   = 'result.xml';
    CANDIDATE_ARCH_FILE_NAME = 'candidate.xml';


    %FAILURES_LIMIT = 10;
    startPoint = AssignGlArchitecture(...
                    CURRENT_ARCH_FILE_NAME, ...
                    startFileName);
    
    
    candidateArchName = CANDIDATE_ARCH_FILE_NAME;
    resultArchName = CURRENT_ARCH_FILE_NAME;
    
    
    resultFunc = GenerateArchitecture(...
                            resultArchName, ...
                            data, ...
							REWRITING_COUNT);
                            
    [trainedArch, optimizer, vtError] = FindGlobalMaximum(resultFunc);

    %%trainedArch.error = 5; %% This is a stub
    
    
    failuresCounter = 0;
    while (failuresCounter < FAILURES_LIMIT)
        if DO_LOGGING
            save 'ArchResult.mat' trainedArch resultFunc vtError
        end
        
        RandomMutation(resultArchName, candidateArchName); 
        candidateFunc = GenerateArchitecture(...
                                candidateArchName, ...
                                data, ...
								REWRITING_COUNT);  
                            
                                
                                
        [trainedCandidate, optimizerC, vtErrorC] = FindGlobalMaximum(candidateFunc);
        %%trainedCandidate.error = 0; %% This is a stub
        
        vtError = [vtError vtErrorC];
        
        if (trainedCandidate.error < trainedArch.error)    
        %<if>
			resultArchName = candidateArchName;
            trainedArch    = trainedCandidate ;
            resultFunc     = candidateFunc    ;
            %vtError = vtErrorC;
            
            startPoint = AssignGlArchitecture(...
                            CURRENT_ARCH_FILE_NAME, ...
                            CANDIDATE_ARCH_FILE_NAME);
            
            failuresCounter = 0;
        %</if>
        else
            failuresCounter = failuresCounter + 1; 
        end
    end

return
end
