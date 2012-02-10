function [] = TestCalculateError()

signal = [4 -12 5];
expected = [ 2 3];

outputIndexes = [2 3];

err = CalculateError(signal, outputIndexes, expected);
AssertEqual( err, mse([14 -2]) );

disp('TestCalculateError successfull');
