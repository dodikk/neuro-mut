function ...
    [ result ] = ...
CreateStartPoint( ...
    dimensionsCount, ...
    low, ...
    up)
%
%
%%%%%%%%%%%%%%%%


%%Stub for the cascade correlation solution of the 
%%Two spirals problem

% result.weights = [ ...
% 0	0	16.482206 	-13.519649 	-2.407861 	8.233824 	-5.691176 	-5.287465 	-3.632568 	4.357163 	-1.447946 	4.546345 	-4.388394	-1.014664 	2.703683 	-4.292825 	0	0 ; ...
% 0	0	-118.390256 	-2.871400 	-12.566088 	-5.865803	-7.041699 	4.026505 	-3.718837 	3.718914 	-5.136195	3.813298	3.448031 	0.070360 	-3.424804 	2.715380 	0	0 ; ...
% 0	0	0	20.714157 	-0.989280 	-7.545930 	-8.317019	3.332767	-14.661171 	4.097464 	-1.451744 	7.499075 	1.451294 	2.566647 	-1.730809 	0.506498 	0	0 ; ...
% 0	0	0	0	-31.034039 	1.442905 	-6.443207 	-4.222688 	-9.343128	-8.985233 	-3.746169 	1.126183 	-4.727368 	-0.822016 	0.813796 	-6.492351 	0	0 ; ...
% 0	0	0	0	0	-29.313542 	-0.742867 	5.444021	-0.553599 	1.682866 	-0.175341 	5.466231 	0.542935 	2.388321 	-1.251877 	4.519850 	0	0 ; ...
% 0	0	0	0	0	0	28.916661	1.953919 	-6.545486 	-8.786207 	0.827950	-0.147248 	1.489417 	0.330689 	-10.827459 	8.187420 	0	0 ; ...
% 0	0	0	0	0	0	0	25.960659	-14.067051 	2.061618	-8.943056 	11.687935 	4.375984 	-0.825908 	0.242697 	4.037919 	0	0 ; ...
% 0	0	0	0	0	0	0	0	-3.209143 	42.651807	-8.097755 	1.961856 	0.875736 	-2.106127 	10.123389 	-3.189959 	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	13.563764 	21.347918 	3.432945 	-3.124494 	19.488372 	3.021724 	-10.923728 	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	0	-3.435164 	2.871611 	-5.440099 	-20.618116 	2.055222 	13.226882	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	0	0	19.260256	-0.541128 	0.423752 	1.276955 	0.064510 	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	0	0	0	25.273576 	-5.418852 	-7.877641 	-2.815611 	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	0	0	0	0	26.205933 	-0.759597 	-9.028856 	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	0	0	0	0	0	10.055540 	-20.516628 	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-2.772114 	0	0 ; ...
% 0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0 ; ...
% -0.041142	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0 ; ...
% 0	-0.067815	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0 ...
% ];
% result.error = inf;
    

    % Random start point strategy
    result = RandomPoint(dimensionsCount, low, up);

return
end

