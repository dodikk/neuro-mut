function [ result ] = WeightInRange(row, col, weights, lowBorder, upBorder)
%
%
%%%%%%%%%%%%%%%%%%%%%

w = weights(row, col);
l = lowBorder(row, col);
u = upBorder(row, col);

result = (l <= w && w <= u);

return
end
