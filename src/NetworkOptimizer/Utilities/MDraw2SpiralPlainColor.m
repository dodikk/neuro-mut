function [] = MDraw2SpiralPlainColor( data, middle, fmt1, fmt2 )
%
%
%%%%%%%%%%%%%%%%%%

    dataSize = size(data.input, 2);
    
    xRed   = [];
    yRed   = [];
    xGreen = [];
    yGreen = [];

    for index = 1 : dataSize
        item = data.input(1:end, index)';
        testValue = data.expected(index);
        
        if (testValue >= middle)
            xRed = [xRed item(1)];
            yRed = [yRed item(2)];
        else
            xGreen = [xGreen item(1)];
            yGreen = [yGreen item(2)];
        end
    end

    hold on
    
    
   
    
    plot(xRed  , yRed  , fmt1, 'LineWidth', 2, 'MarkerFaceColor',[0 0 0]);
    plot(xGreen, yGreen, fmt2);
    
    hold off

return
end
