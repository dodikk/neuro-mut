function ...
    [ result ...
    ] = ...
LSystemRewrite1...
    ( axiom, ...
      rules ...
    )
% Performs a single L-System rewriting step
% Rules have no context. The first (to the left) rule is applied.
    [expansions, length_vt] = GetExpansions(axiom, rules);
    result = ApplyExpansions(expansions, length_vt);
return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [ result_vt, ...
      length_vt...
    ] = ...
GetExpansions...
    ( axiom, ...
      rules ...
    )
%%%%%%%%%%%%%%
    result_vt = cellstr(axiom'); 
    length_vt = ones( size(result_vt) );
    nRules = size(rules, 2);
    
    for j = 1 : nRules
        %the indexes of each 'before' string
        pattern = rules(j).before;
        
        hit = strfind(axiom, pattern);
        if (length(hit) < 1)
            continue;
        end
            
            
       for k = hit              
           result_vt{k} = rules(j).after;
           length_vt(k) = size(pattern, 2);
       end        
    end

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [ result ...
    ] = ...
ApplyExpansions...
    ( expansions, ...
      length_vt ...
    )

    result=[];
    index = 1;
    len = length(expansions);
    
    while (index <= len)
        result = [result expansions{index}];
        index = index + length_vt(index);
    end

return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
