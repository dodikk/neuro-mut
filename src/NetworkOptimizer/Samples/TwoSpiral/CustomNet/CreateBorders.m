function [ low, up ] = CreateBorders(  )

neuronsCount = 20;

low = ones(neuronsCount, neuronsCount) * (-100); 
up  = ones(neuronsCount, neuronsCount) * (+100);
