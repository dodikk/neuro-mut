function [data] = CreateTwoSpiralTestDataForMatlab()
%
%
%%%%%%%%%%%%%%%%%%%%

low  = -6.5;
up   = +6.5;
step = 0.05;

len = (up - low) / step;
count = len * len;

data = zeros(2, count); 


inIndex = 1;
for xIndex = low : step : up
    for yIndex = low : step : up
	    data(1, inIndex) = xIndex;
		data(2, inIndex) = yIndex;
		
        inIndex = inIndex + 1;
    end 
end

return
end
