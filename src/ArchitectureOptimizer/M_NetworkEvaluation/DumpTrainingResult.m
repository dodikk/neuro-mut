function [] = DumpTrainingResult(strName, trainError, neuronsCount, testError)

    msg = sprintf(...
        '%s  : TrainError=%f   NeuronsCount=%i    TestError = %f', ...
        strName, trainError, neuronsCount,  testError);

    disp(msg);

return
end
