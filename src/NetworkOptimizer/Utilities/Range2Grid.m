function [ data ] = Range2Grid(x, y)

xSize = size(x, 2);
ySize = size(y, 2);
dataSize = xSize * ySize;

in = cell(1, dataSize);
exp = cell(1, dataSize);

index = 1;
for xx = 1 : xSize
   for yy = 1 : ySize
      xItem = x(xx);
      yItem = y(yy);
      
      in{index} = [xItem yItem];
      %exp{index} = [xItem^2 + yItem^2];
      
      index = index + 1;
   end
end

%data.input = in;
%data.expected = exp;

data = in;
