function [] = TestLargestInterval()

dimCount = 4;

low = [-1 -1; -1 0.7];
up = [1 1; 1 0.7];
middle = [-0.5 0; 0.5 0.7];

pLow = ZeroPoint(dimCount);
pLow.weights = low;

pUp = ZeroPoint(dimCount);
pUp.weights = up;

pMid = ZeroPoint(dimCount);
pMid.weights = middle;

range = {pLow pUp pMid};


[l1, u1] = FindLargestInterval(1, 1, range);
AssertEqual(l1, -0.5);
AssertEqual(u1, 1);


[l2, u2] = FindLargestInterval(1, 2, range);
AssertEqual(l2, -1);
AssertEqual(u2, 0);

[l3, u3] = FindLargestInterval(2, 1, range);
AssertEqual(l3, -1);
AssertEqual(u3, 0.5);


[l4, u4] = FindLargestInterval(2, 2, range);
AssertEqual(l4, 0.7);
AssertEqual(u4, 0.7);


disp('Test Large interval successfull');
