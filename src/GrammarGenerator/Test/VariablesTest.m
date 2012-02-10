text = '_a_b_ba_b_ba';
vars = GetVariables(text);
expectedVars = {'a', 'b', 'ba'};

if (false == isequal(vars, expectedVars))
    error('Variable test failed');
else
    disp('GetVariables test1 OK');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lSystem = xml_load('cascade.xml');

srcVars = GetSourceVariables(lSystem);
expectedSrcVars = {'a', 'b', 'd'};

if (false == isequal(srcVars, expectedSrcVars))
    error('GetSourceVariables test failed');
else
    disp('GetSourceVariables test1 OK');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lSystem = xml_load('cascade.xml');

prodVars = GetProductionVariables(lSystem);
expectedProdVars = {'a', 'b', 'c', 'd'};

if (false == isequal(prodVars, expectedProdVars))
    error('GetProductionVariables test failed');
else
    disp('GetProductionVariables test1 OK');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lSystem = xml_load('cascade.xml');

prodVars = GetProductionVariablesSeparate(lSystem);
expectedProdVars = {'c'};

if (false == isequal(prodVars, expectedProdVars))
    error('GetProductionVariablesSeparate test failed');
else
    disp('GetProductionVariablesSeparate test1 OK');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lSystem = xml_load('cascade.xml');

srcVars = GetSourceVariablesSeparate(lSystem);
expectedsrcVars = cell(1, 0);

if (false == isequal(srcVars, expectedsrcVars))
    error('GetSourceVariablesSeparate test failed');
else
    disp('GetSourceVariablesSeparate test1 OK');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
