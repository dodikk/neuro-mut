function [cut] = ParseCut(row)

    cutGeometry = [];
    
    points = ParseDetailPoints(row);
    cut = CreateCut(points, cutGeometry);

return
end
