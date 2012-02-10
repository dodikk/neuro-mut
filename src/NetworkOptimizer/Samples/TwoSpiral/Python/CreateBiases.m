function [ biases ] = CreateBiases()

 bIndexes = [1 2];
 biasCount = size(bIndexes, 2);
 
 bLow = ones(1, biasCount) * (-10);
 bUp  = ones(1, biasCount) * (+10);
 
 biases.indexes = bIndexes;
 biases.low = bLow;
 biases.up = bUp;
