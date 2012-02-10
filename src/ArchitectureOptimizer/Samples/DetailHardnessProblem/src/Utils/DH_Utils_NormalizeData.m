function [result] = DH_Utils_NormalizeData(...
    index  ,          ...
    srcBeg , srcFin , ...
    destBeg, destFin)
%
%
%%%%%%%%%%%%
    
    %% inclusive range
    srcLength  = srcFin  - srcBeg ; 
    destLength = destFin - destBeg; 


    assert(srcLength  > 0);
    assert(destLength > 0);
    
    step = destLength ./ srcLength;

    vt1 = ones(size(index));
    offset = index.* vt1 - srcBeg .* vt1;
    
    result = destBeg + step .* offset;
    
return
end

