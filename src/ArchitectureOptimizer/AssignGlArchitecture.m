function [lResult] = AssignGlArchitecture(dest , src)
%
%
%%%%%%%%%%%%%%

     lResult = xml_load(src);
     xml_save(dest, lResult);


return
end
