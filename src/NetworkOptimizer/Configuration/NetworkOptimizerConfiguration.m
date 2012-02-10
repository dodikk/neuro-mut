function [result] = NetworkOptimizerConfiguration()

    [ fileName, itemName ] = NetworkOptimizerConfigurationFileName();
    rawStruct = load(fileName, itemName);
    
    result = rawStruct.conf; %% Hard coded. Fix this

return
end
