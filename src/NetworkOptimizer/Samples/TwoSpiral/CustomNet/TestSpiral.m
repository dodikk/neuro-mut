function [ ] = TestSpiral(  )

radius = 6.5;
density = 1;
%% classical params

count = 200;
[x1, y1] = CreateSpiral(radius, density, count, 'xy'); 
[x2, y2] = CreateSpiral(radius, density, count, ''); 

plot(x1, y1,...
     'b'); %'bo');

hold on
    plot(x2, y2, ...
         'r'); %'rs');
hold off

