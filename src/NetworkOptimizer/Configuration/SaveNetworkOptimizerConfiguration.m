function [] = SaveNetworkOptimizerConfiguration(conf)

    [ fileName, itemName ] = NetworkOptimizerConfigurationFileName();
    save(fileName, itemName);
    
return
end
