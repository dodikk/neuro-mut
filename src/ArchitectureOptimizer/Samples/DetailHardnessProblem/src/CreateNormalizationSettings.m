function [normalizationSettings] = CreateNormalizationSettings()
% TODO : fix hardcoded range values.
%
%%%%%%%%%%%%%%%%%%%%%%


	normalizationSettings.cutIdRange    = DH_Utils_CreateRange(1,    3);
	normalizationSettings.radiusRange   = DH_Utils_CreateRange(0, 16.5);
	normalizationSettings.hardnessRange = DH_Utils_CreateRange(0,  800);

	
	normalizationSettings.durationRange      = DH_Utils_CreateRange(0,  100);
	normalizationSettings.airPressureRange   = DH_Utils_CreateRange(0,    5);
	normalizationSettings.waterPressureRange = DH_Utils_CreateRange(0,    5);
	
	normalizationSettings.targetRange        = DH_Utils_CreateRange(-1, 1);
	

return
end

