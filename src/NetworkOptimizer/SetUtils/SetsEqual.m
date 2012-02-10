function [ result ] = SetsEqual( setL, setR )
%Checks if sets are equal
%%%%%%%%%%%


    l = sort(setL);
    r = sort(setR);
    
    lInR = IsSubset(setL, setR);
    rInL = IsSubset(setR, setL);
    
    result = (lInR && rInL);

return
end
