function [ result ] = RandomVector( dimensionsCount )
% Point is a weight matrix.
% The items are in the [-1; +1] range.

    %%  maybe useful : norm(randomVector) = 1
    result = 2 * rand(dimensionsCount) - ones(dimensionsCount);
    
return
end
