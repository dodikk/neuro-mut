function [result] = Struct2Mat(struct)

    c = struct2cell(struct);
    result = cell2mat(c);

return
end

