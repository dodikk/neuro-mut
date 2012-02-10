function [ low, up ] = CreateBorders(  )

neuronsCount = 13;

low = ones(neuronsCount, neuronsCount) * (-100); 
up  = ones(neuronsCount, neuronsCount) * (+100);
