function [ result ] = LoadArchitecture( fileName )
%
%
%%%%%%%%%%%%%%%%%%%

rawData = load(fileName);
[result, endOfArchitecture] = ParseArchitecture(rawData);

return
end
