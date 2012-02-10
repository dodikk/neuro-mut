function [trainedNet, trainError, testError] = EvaluateNetwork(net, data, settings)

    TRAIN_DATA_PART = settings.TRAINING_PERCENT;
    [trainData, testData] = SplitData(data, TRAIN_DATA_PART);

    net.trainParam.show = inf; %%No matlab logs
	[trainedNet,tr,Y,E,Pf,Af] = train(net, trainData.input, trainData.expected);
	trainError = mse(E);
    
    [Y, Pf, Af, E, testError] = sim(trainedNet, testData.input, [], [], testData.expected);
    

return
end
