function [ result ] = RandomInteger( limit )
% Generates random integer in range [1 .. limit]
% 

    randPerm = randperm(limit);
    result = randPerm(1);

return
end
