function [ result ] = Grammar()
%
%

result.variableSeparator = '_';
result.attributePredcessor = ':';
result.subgraphStart = '[';
result.subgraphEnd = ']';

result.inAttribute = 'i';
result.outAttribute = 'o';
result.inOutAttribute = 'io';

result.positive = '+';
result.negative = '-';

return
end
