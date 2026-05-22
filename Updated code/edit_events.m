addpath('O:\Documents\Neural entrainment to native and foreign speech\Neural_entrainment_logfiles');
addpath('O:\Documents\Documents\eeglab_current\eeglab13_6_5b');
prompt='filename=';
filename=input(prompt);
[out1,out2]=importPresentationLog(filename);
stims=out2.code;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;          % start EEGLAB under Matlab 
EEG = pop_fileio();                               % import data
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG); % copy it to ALLEEG

i=1;
N=length(EEG.event);
while i<=N
    if regexp('empty',EEG.event(i).type)
        EEG.event(i)=[];
        i=i-1;
        N=N-1;              
    end
    i=i+1;
end
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);% copy changes to ALLEEG

for i=1:(length(stims)-1)
EEG.event(i).type=cell2mat(stims(i));
end

[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
