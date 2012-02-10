function [patterns, answers] = Data2TrainingSet(probesVt, conditionsVt)

    probesCount     = size(probesVt, 2);
    conditionsCount = size(conditionsVt, 2);
    
    assert(probesCount == conditionsCount);
    
    patterns = [];
    answers  = [];
    itemsCount = probesCount;
    
    
    for itemIndex = 1 : itemsCount
        condition = conditionsVt(itemIndex);
        probe     = probesVt{itemIndex};
        
        
        rawCondition  = Conditions2Row(condition);
        rawProbeItems = Probe2TrainingItems(probe);
        
        probeItemsCount = size(rawProbeItems, 1);
        rawConditionSet = repmat(rawCondition, probeItemsCount, 1);
        
        patterns = [patterns; rawProbeItems  ];
        answers  = [answers ; rawConditionSet];
    end
    
return
end

