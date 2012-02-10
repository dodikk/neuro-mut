function [result] = DH_Utils_NormalizeAnswerData(...
    data, ...
    durationRange, airPressureRange, waterPressureRange, ...
    targetRange)
%
%
%%%%%%%%%%%55


    %% TODO : fix hard code
    phasesCount = 2;
    phaseSize   = 3;
    
    result = zeros(size(data));
    
    constantsHolder = DH_SettingsItemConstants();
    [itemsCount, dataItemSize] = size(data);

    featureIndex = 1;
    while (featureIndex < dataItemSize)
        
        result(1:end, featureIndex) =                       ...
            DH_Utils_NormalizeData(                         ...
                data(1:end, featureIndex)                 , ...
                airPressureRange.low , airPressureRange.up, ...
                targetRange.low      , targetRange.up     );

        result(1:end, featureIndex + 1) =                      ...
            DH_Utils_NormalizeData(                            ...
                data(1:end, featureIndex + 1)                , ...
                waterPressureRange.low, waterPressureRange.up, ...
                targetRange.low       , targetRange.up       );

        result(1:end, featureIndex + 2) =            ...
            DH_Utils_NormalizeData(                  ...
                data(1:end, featureIndex + 2)      , ...
                durationRange.low, durationRange.up, ...
                targetRange.low  , targetRange.up  );
                
        featureIndex = featureIndex + phaseSize;
    end
    

return
end