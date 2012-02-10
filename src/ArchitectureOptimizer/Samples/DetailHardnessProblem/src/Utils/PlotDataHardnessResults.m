function [] = PlotDataHardnessResults(    ...
    expectedAirPlot  , receivedAirPlot  , ...
    expectedWaterPlot, receivedWaterPlot)
%
%
%%%%%%%%%%%
    subplot(2,1,1);
    hold on
    plot(expectedAirPlot, '-b');
    plot(receivedAirPlot, '-r');

    title('Air pressure');
    legend('Received', 'Expected');
    hold off
    
    
    
    subplot(2,1,2);
    hold on
    plot(expectedWaterPlot, '-b');
    plot(receivedWaterPlot, '-r');
    
    legend('Received', 'Expected');
    title('Water pressure');
    hold off

return
end
