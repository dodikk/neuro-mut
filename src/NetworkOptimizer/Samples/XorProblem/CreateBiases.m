function [ biases ] = CreateBiases()

bIndexes = [3 4 5];
bLow = [-10 -10 -10];
bUp  = [+10 +10 +10];

biases.indexes = bIndexes;
biases.low = bLow;
biases.up = bUp;
