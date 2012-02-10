function [ result ] = HorizontalCell2Mat( cellData )

    result = [];
    cellSize = size(cellData, 2);
    
    for index = 1 : cellSize
      result = [result; cellData{index}];
    end

return
end
