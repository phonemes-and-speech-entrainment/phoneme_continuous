function ITPC=itpc_short(eegspects)

%C_phase = zeros(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(eegspects,5), size(eegspects,6));


phase = eegspects ./ abs(eegspects);

C_phase = abs(mean(phase,4));

ITPC = squeeze(abs(mean(C_phase,4)));