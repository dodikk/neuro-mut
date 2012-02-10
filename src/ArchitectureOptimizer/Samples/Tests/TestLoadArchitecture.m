function [ ] = TestLoadArchitecture()
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
in  = {[0 0] [0 1] [1 0] [1 1]};
exp = {[0]   [1]   [1]   [0]  };

data.input = in;
data.expected = exp; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
fileName = 'cascade.xml';
net = GenerateArchitecture(fileName, data, 1);



disp('TestLoadArchitecture successfull');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
return
end

