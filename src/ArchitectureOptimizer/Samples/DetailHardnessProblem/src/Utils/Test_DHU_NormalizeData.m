disp('Normalization test...');

a = [1 2 3];
aa =  DH_Utils_NormalizeData(a, 1, 3, -1, 1);
assert(ArrayEqual(aa, [-1 0 1]));

bb =  DH_Utils_NormalizeData(aa, -1,c 1, 1, 3);
assert(ArrayEqual(a, bb));

bbb = DH_Utils_DeNormalizeData(aa, 1, 3, -1, 1);
assert(ArrayEqual(bbb, bb));


t1 = DH_Utils_NormalizeData( 0, 0, 200, -1,   1);
assert(t1 == -1);

t1 = DH_Utils_NormalizeData(-1, -1,  1,  0, 200);
assert(t1 == 0);


t1 = DH_Utils_NormalizeData( 100, 0, 200, -1,   1);
assert(t1 == 0);


t1 = DH_Utils_NormalizeData(0, -1,  1,  0, 200);
assert(t1 == 100);

disp('Passed successfully.');
