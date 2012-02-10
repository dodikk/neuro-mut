function [ low, up ] = CreateBorders(  )

neuronsCount = 16;

low = ones(neuronsCount, neuronsCount) * (-10); 
up  = ones(neuronsCount, neuronsCount) * (+10);
