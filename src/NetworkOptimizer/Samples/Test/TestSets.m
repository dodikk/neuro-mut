function [  ] = TestSets( )

status = SetsEqual([1 3 2], [1 2 3]);
AssertEqual(true, status);

status = IsSubset([1 3 2], [1 2 3]);
AssertEqual(true, status);


status = SetsEqual([1 3 2 4], [1 2 3]);
AssertEqual(false, status);

status = IsSubset([1 3 2 4], [1 2 3]);
AssertEqual(false, status);


status = IsSubset([1 3], [1 2 3]);
AssertEqual(true, status);

disp('Test sets successfull');
