function [points] = ParseDetailPoints(row)

    points = [];
    index = 1;
    rowSize = size(row, 2);
        
    while (index <= rowSize)
        radius   = row(1, index    );
        hardness = row(1, index + 1);
        
        point = CreateDetailPoint(radius, hardness);
        points = [points point];
        
        index = index + 2;
    end
    
return
end
