function [ ] = DrawTrainingSet( )

data = CreateData();

plotZ = HorizontalCell2Mat(data.expected);

mData = HorizontalCell2Mat(data.input);
mData = horzcat(mData, plotZ);

mData = sortrows(mData, [3 1 2]);

plotX = mData(:, 1)';
plotY = mData(:, 2)';
plotZ = mData(:, 3)';


plot3(plotX, plotY, plotZ, ':o');
grid on
axis square
