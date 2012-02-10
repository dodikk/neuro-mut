function [ result ] = ZeroPoint( dimensionsCount )
% Point is a weight matrix and error.
%%%%%%%%%%%%%%%%%%%%%%%%%
% struct Point
% {
%   Matrix weights_;
%   int error_;
% }
%%%%%%%%%%%%%%%%%%%%%%%%%
    result.weights = zeros(dimensionsCount);
    result.error = inf;
return
end
