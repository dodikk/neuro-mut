function [] = Draw2SpiralPlain( data, middle )
%
%
%%%%%%%%%%%%%%%%%%

    dataSize = size(data.input, 2);
    
    xRed   = [];
    yRed   = [];
    xGreen = [];
    yGreen = [];

    for index = 1 : dataSize
        item = data.input{index};
        testValue = data.expected{index};
        
        if (testValue >= middle)
            xRed = [xRed item(1)];
            yRed = [yRed item(2)];
        else
            xGreen = [xGreen item(1)];
            yGreen = [yGreen item(2)];
        end
    end

    hold on
    
    plot(xRed, yRed, 'r.');
    plot(xGreen, yGreen, 'g.');
    
    hold off

return
end


