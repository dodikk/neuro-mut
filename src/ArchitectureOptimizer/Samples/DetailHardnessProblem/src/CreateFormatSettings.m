function [result] = CreateFormatSettings(version)

    result = [];
    
    result.version = version;

    if (version == 1)
        result.stagesPerCondition = 2;
        result.cutsPerProbe       = 3;
        result.delimiter          = ';';
        
        result.hasTemperature = false;
    else
        error('Wrong version');
    end

return
end
