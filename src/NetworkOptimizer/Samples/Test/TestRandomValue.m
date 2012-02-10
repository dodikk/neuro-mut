function [] = TestRandomValue()

low = -5;
up = 17.345234;

res = RandomValue( low, up );

if (res < low) || (res > up)
    disp('RandomValue test failed');
else
    disp('RandomValue test successfull');
end
