function [trainData, testData] = SplitData(data, trainDataPercent)

    trainData.input    = [];
    trainData.expected = [];
    testData.input     = [];
    testData.expected  = [];

    dataSize = size(data.input, 2);
    
    mixedIndexes = randperm(dataSize);
    delimiter = round(trainDataPercent * dataSize);
    
    
    for index = 1 : delimiter
       itemIndex = mixedIndexes(index);
       
       itemIn  = data.input   (1:end, itemIndex);
       itemOut = data.expected(1:end, itemIndex);
       

       trainData.input    = [trainData.input    itemIn ];
       trainData.expected = [trainData.expected itemOut];
    end


    
    
    for index = delimiter + 1 : dataSize
       itemIndex = mixedIndexes(index);
       
       itemIn  = data.input   (1:end, itemIndex);
       itemOut = data.expected(1:end, itemIndex);

       testData.input    = [testData.input    itemIn ];
       testData.expected = [testData.expected itemOut];
    end

    
return
end

