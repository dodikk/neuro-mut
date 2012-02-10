function ...
    [x1, y1] = ...
CreateSpiral(...
    maxRadius, ...
    density, ...
    count, ...
    noiseMode)
%
%
%%%%%%%%%%%%%%%%%%%
    x1 = []; y1 = [];

    angle = 0;
    radius = 0;
    for index = 1 : count
       angle = (index * pi) / (16 * density);
       
       tmp = 104 * density;
       radius = maxRadius * (tmp - index) / tmp;
       
       nX = radius * cos(angle);
       nY = radius * sin(angle);
       
       [nX, nY] = AddNoise(nX, nY, noiseMode);
       
       x1 = [x1 nX];
       y1 = [y1 nY];    
    end

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [nX, nY] = AddNoise(x, y, noiseMode)

    NOISE = 0.12;
    xFlag = 'x';
    yFlah = 'y';
    
    nX = x;
    nY = y;
    
    noiseX = (2 * rand() - 1) * NOISE;
    noiseY = (2 * rand() - 1) * NOISE;

    b_xNoise = ~isempty(strfind(noiseMode, xFlag));
    b_yNoise = ~isempty(strfind(noiseMode, yFlah));
       

    if (b_xNoise)
        nX = nX + noiseX;
    end
       
    if (b_yNoise)
        nY = nY + noiseY;
    end
       
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
