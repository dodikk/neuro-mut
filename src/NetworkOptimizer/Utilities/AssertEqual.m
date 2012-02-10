function [] = AssertEqual( a, b )

if (a ~= b)
   error('AssertEqual failed'); 
end

return
end
