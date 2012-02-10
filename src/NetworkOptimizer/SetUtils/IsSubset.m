function [ result ] = IsSubset( set, universe )
%Checks if set "universe" contains set "set"
%%%%%%%%%%%

    itemsStatus = ismember(set, universe);
    
    setSize = size(set, 2);
    for index = 1 : setSize
       if (itemsStatus(index) == false) 
           result = false;
           return
       end
    end
    
    result = true;
    return
end
