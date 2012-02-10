CreateNetworkOptimizerConfiguration(); %%?????????????????

data.input = {[0 0]  [0 1]  [1 0]  [1 1]};
data.expected = {[0] [1] [1] [0]};

%startPoint = xml_load('start.xml');

startPoint = 'start.xml';

failuresCount = 10;
REWRITING_COUNT = 3;
[resultArch, ...
 trainedArch, ...
 preparedData] = OptimizeArchitecture(...
					  startPoint, ...
					  data, ...
					  failuresCount, ...
					  REWRITING_COUNT);

xml_save('result.xml', result);


