function ...
    [resultNet      , ...
     resultNetPerfT , ...
     resultNetPerf  ] = ...
M_GetBestNetOfCurrentArchitecture(...
    archName, ...
    data, ...
    settings)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxRewritingCount = settings.REWRITING_COUNT;
maxNeuronCount    = settings.NEURONS_LIMIT;


	rCount  = 0;
    previousPerf = inf;
	
	resultNet = M_GenerateArchitecture(archName, data, rCount);    
    [resultNet, resultNetPerfT, resultNetPerf] = EvaluateNetwork(resultNet, data, settings);
    
	net = [];
	
	
	for rCount = 1 : maxRewritingCount
        for triesUsed = 1 : settings.LEARN_TRIES_COUNT
            msg1 = sprintf('Evaluating network after %i rewritings...', rCount);
            msg2 = sprintf('Tries : %i out of %i', triesUsed, settings.LEARN_TRIES_COUNT);
            disp(msg1);
            disp(msg2);
            net = M_GenerateArchitecture(archName, data, rCount);

% %             fileName = sprintf('EvalSingleArch%i.mat', rCount);
% %             save(fileName, 'net');

            if (net.numLayers > maxNeuronCount)
				disp('Architecture limitations exceeded.');
				disp('Done with this architecture.');
                return;
            end


            [net, currPerfT, currPerf] = EvaluateNetwork(net, data, settings);

            DumpTrainingResult('Candidate', currPerfT     , net.numLayers      , currPerf     );
            DumpTrainingResult('Best     ', resultNetPerfT, resultNet.numLayers, resultNetPerf);
            disp('--------------------------');

            if (currPerf < resultNetPerf)
                resultNetPerf  = currPerf ;
                resultNet      = net      ;
                resultNetPerfT = currPerfT;
                
% %                 if (currPerf < settings.ACCEPTABLE_ERROR)
% %                     previousPerf = inf;
% %                     break; %%return ???
% %                 end
            end %%if
            
            
% %             perfDiff = abs(currPerf - previousPerf);          
% %             previousPerf = currPerf;
% %             
% %             if (perfDiff < settings.MIN_ERROR_DIFF)
% %                 previousPerf = inf;
% %                 break;
% %             end

        end %%learn tries count
    end %%maxRewritingCount


return
end



