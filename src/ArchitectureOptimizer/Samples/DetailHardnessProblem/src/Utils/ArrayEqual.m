function [result] = ArrayEqual(a1, a2)

    result = false;

    [row1, col1] = size(a1);
    [row2, col2] = size(a2);
    
    if (row1 ~= row2) || (col1 ~= col2)
       result = false;
       return;
    end
    
    expectedOnes = row1 * col1;
    
    eq1 = (a1 == a2);
    indexes = find(eq1 == 1);
    
    [receivedCols, receivedRows] = size(indexes);
    receivedOnes = receivedCols * receivedRows;
    
    result = (receivedOnes == expectedOnes);

return
end
