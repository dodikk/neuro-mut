function [] = PlotMatlabBackup(fileName)

load(fileName)

testData = CreateTwoSpiralTestDataForMatlab();
[actual, Pf, Af, errors, perf] = sim(net, testData);
plotData.input = testData;
plotData.expected = actual;


nCountMsg = sprintf('Neurons count : %f', net.numLayers);
disp(nCountMsg);


trainPlotData = CreateTwoSpiralDataForMatlab();
dataDelimiter = 0;

hold on
MDraw2SpiralPlainColor(plotData, dataDelimiter, 'r.', 'g.');
MDraw2SpiralPlainColor(trainPlotData, dataDelimiter, 'ko', 'k*');
hold off


return
end


