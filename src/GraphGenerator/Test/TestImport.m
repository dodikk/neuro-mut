function [] = TestImport()
%
%

rawData = [4 4 0 1 1 1 0 0 1 1 0 0 0 1 0 0 0 0 1 3 0 1 2 1 1 3 4 4 0 3 1 2 2 1 3];

[result, ...
 tSortInfo, ...
 endOfArchitecture ...
]= ParseConnMapWithTSortInfo( rawData );

disp('Net : ');
disp(result.connections);
disp('Inputs :');
disp(result.inputs);
disp('Outputs :');
disp(result.outputs);

disp('SortInfo');
disp(tSortInfo);



return
end
