function [result] = CreateFormatSettings(version)

    result = [];
    
    result.version = version;

    if (version == 4)
        result.stagesPerCondition = 3;
        result.cutsPerProbe       = 3;
        result.delimiter          = ';';
		
		result.hasTemperature = true;
    else
        error('Wrong version');
    end

return
end
