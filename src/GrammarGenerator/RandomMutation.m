function [] = RandomMutation(lSystemFileName, destinationFileName)



mutationKinds = MutationKinds();
mutationKindsSize = size(mutationKinds, 2);

index = RandomInteger(mutationKindsSize);

names = MutationNames();
msg = sprintf('Mutation operator : %s', names{index});
disp(msg);


MutationCallback = mutationKinds{index};
LSystemMutation(lSystemFileName, destinationFileName, MutationCallback);

return
end
