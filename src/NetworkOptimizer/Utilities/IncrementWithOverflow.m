function [ result ] = IncrementWithOverflow( currentIndex, upperBound )
%
%
%%%%%%%%%%%%%%%%%%%%%%

    result = mod(currentIndex + 1, upperBound);

    if (0 == result)
        result = upperBound;
    end

return
end
