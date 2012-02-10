function [ result ] = FahlmanFunc( x )

if (x < -15.0)
 result = -0.5;
elseif (x >  15.0)
 result = 0.5;
else
 result = logsig(x) - 0.5;
end
                
return
end
