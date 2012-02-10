function [airPlot, waterPlot] = GetPhasesPlotData(phases)

    airPlot   = [];
    waterPlot = [];

    phasesCount = size(phases, 2);
    for phaseIndex = 1 : phasesCount
       phase = phases(phaseIndex);
       
       %% hot fix
       airChunk   = phase.airPressure   * ones(1, phase.duration);
       waterChunk = phase.waterPressure * ones(1, phase.duration);
       
       airPlot   = [airPlot   airChunk  ];
       waterPlot = [waterPlot waterChunk];
    end
    
    
return
end
