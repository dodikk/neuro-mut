function [result] = DetailPoint2Row(point, cutIndex)

    result = Struct2Mat(point);
    result = result';
    result = [cutIndex result];

return
end

