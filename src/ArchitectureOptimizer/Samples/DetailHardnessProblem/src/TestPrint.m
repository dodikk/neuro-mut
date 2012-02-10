function [] = TestPrint()

    conditions = [];

    conditions.startTemperature = 950;
    conditions.haltTime         =  30;


    p1 = CreateDetailPhase(20, 1.5, 2.5);
    p2 = CreateDetailPhase(50,   0,   0);

    conditions.phases = [p1 p2];

    PrintDetailConditions(conditions);

    
    [airPlot, waterPlot] = GetPhasesPlotData(conditions.phases);
    
    hold on
    
    plot(airPlot  , 'r');
    plot(waterPlot, 'b');
    
    hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    Conditions2Row(conditions)
return 
end
