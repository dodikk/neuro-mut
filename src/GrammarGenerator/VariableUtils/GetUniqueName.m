function ...
    [ result ] = ...
GetUniqueName( ...
    input_args ...
)
% Generates a short unique name
% 

tmpPath = tempname();

[pathstr,...
 name,...
 ext,...
 versn] = fileparts(tmpPath);

result = name;

return
end
