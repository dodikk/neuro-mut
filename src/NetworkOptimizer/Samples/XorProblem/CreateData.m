function [ data ] = CreateData(  )

in  = {[0 0] [0 1] [1 0] [1 1]};
exp = {[0]   [1]   [1]   [0]  };

data.input = in;
data.expected = exp;
