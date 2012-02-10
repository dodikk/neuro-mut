function [ ] = TestGetOutputsSignal(  )


signal = [10 20 30 40 50 60];
net.outputs = [2 6];

outSignal = GetOutputsSignal(signal, net);
expected = [20 60];


status = SetsEqual(expected, outSignal);
AssertEqual(status, true);

disp('TestGetOutputsSignal successfull');

