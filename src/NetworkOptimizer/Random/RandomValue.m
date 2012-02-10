function [ result ] = RandomValue( low, up )
% Generates random scalar value from the range
%  

    offset = rand();
    length = up - low;
    result = low + length * offset ;

return
end
