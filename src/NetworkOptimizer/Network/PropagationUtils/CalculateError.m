function ...
    [error ...
    ] = ...
CalculateError(...
    signal, ...
    outputIndexes, ...
    expectedValues)

    answer = [];
    
    outputIndexesCount = size(outputIndexes, 2);
    for index = 1 : outputIndexesCount
       outputIndex = outputIndexes(index);
       signalEntry = signal(outputIndex);
       answer = [answer signalEntry];
    end

    
    [expRow, expCol] = size(expectedValues);
    if ( (expRow ==1) && (expCol == 1) )
        %% Hot fix for the one dimensional outputs.
        error = expectedValues - answer;
    else
        error = mse(expectedValues - answer);    
    end
    
 
return
end
