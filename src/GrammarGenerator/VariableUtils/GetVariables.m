function ...
    [ result ...
    ] = ...
GetVariables(...
    text)
%
%

result = [];

textFN = 'statement.txt';
toolName = 'VarUtility.exe';
outputFN = 'statement.var';



hFile = fopen(textFN, 'w');
fprintf(hFile, '%s', text);
fclose(hFile);



[cmd, errmsg] = sprintf('%s %s %s', toolName, textFN, outputFN);
[exitCode, stdOutput] = system(cmd);


hFile = fopen(outputFN, 'r');
    counter = 1;

    while (false == feof(hFile))    
        lineStr = fgetl(hFile);
        result{counter} = lineStr;
        counter = counter + 1;
    end
fclose(hFile);

return
end
