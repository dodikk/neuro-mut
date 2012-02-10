function [probe] = ParseProbe(rawProbe)

    probe = [];
    rowCount = size(rawProbe, 1);

    for cutIndex = 1 : rowCount
        rawCut = rawProbe(cutIndex, 1:end);
        cut = ParseCut(rawCut);
        
        probe = [probe cut];
    end %%for

        
return
end
