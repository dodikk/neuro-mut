function [] = TestAll()

warning('off', 'all');

CreateConfiguration();

TestSets();
TestRandomValue();
TestLargestInterval();

TestAdjacentSingle();
TestAdjacent();

TestDependencies();

TestUpdateSignal();
TestCalculateError();

TestSimulate();
TestManyPatterns();

TestAddBiasInputs();
TestAddBiasConnections();
TestAddBiases();

TestAddBiasToLowBound();
TestAddBiasToUpBound();
TestGetOutputsSignal();

TestCascadeSimulate();
