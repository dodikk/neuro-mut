function [  ] = TestAddBiasInputs(  )

warning('off', 'all');

in = {[0 0] [0 1] [1 0] [1 1]};
exp = {[0] [1] [1] [0]};

data.input = in;
data.expected = exp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bIndexes = [3 4 5];
bLow = [-10 -10 -10];
bUp  = [+10 +10 +10];

biases.indexes = bIndexes;
biases.low = bLow;
biases.up = bUp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data2 = AddBiasInputs(data, biases);

expIn = {[0 0 1 1 1] [0 1 1 1 1] [1 0 1 1 1] [1 1 1 1 1]}; 
expOut = {[0] [1] [1] [0]};

status = SetsEqual(data2.input{1}, expIn{1});
AssertEqual(true, status);
status = SetsEqual(data2.input{2}, expIn{2});
AssertEqual(true, status);
status = SetsEqual(data2.input{3}, expIn{3});
AssertEqual(true, status);
status = SetsEqual(data2.input{4}, expIn{4});
AssertEqual(true, status);

status = SetsEqual(data2.expected{1}, expOut{1});
AssertEqual(true, status);
status = SetsEqual(data2.expected{2}, expOut{2});
AssertEqual(true, status);
status = SetsEqual(data2.expected{3}, expOut{3});
AssertEqual(true, status);
status = SetsEqual(data2.expected{4}, expOut{4});
AssertEqual(true, status);

disp('TestAddBiasInputs successfull');
