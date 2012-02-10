function [ biases ] = CreateBiases()

 bIndexes = 3:1:13;
 biasCount = size(bIndexes, 2);
 
 bLow = ones(1, biasCount) * (-100);
 bUp  = ones(1, biasCount) * (+100);
 
 biases.indexes = bIndexes;
 biases.low = bLow;
 biases.up = bUp;
