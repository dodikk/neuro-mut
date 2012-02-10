function [ result ] = CreateSpacer( level )

spacer = '   _';
result = '_';

for index = 1 : level   
    result = strcat(result, spacer);
end

strcat(result, '_');

return
end
