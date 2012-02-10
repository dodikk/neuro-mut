function [patterns] = Probe2TrainingItems(probe)

    patterns = [];
    cutsCount = size(probe, 2);
    
    for cutIndex = 1 : cutsCount
       cut = probe(cutIndex);
       cutSize = size(cut.points, 2);
       
       for pointIndex = 1 : cutSize
           rawPoint = DetailPoint2Row(cut.points(pointIndex), cutIndex );           
           patterns = [patterns; rawPoint];
       end %%points
    end %%cuts
    

return
end

