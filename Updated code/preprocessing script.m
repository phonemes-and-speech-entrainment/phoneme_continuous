%run this on mac
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;  
EEG = pop_fileio();                               
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG); 

EEG = pop_eegfiltnew(EEG);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

EEG=pop_chanedit(EEG);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

EEG = pop_reref(EEG);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

EEG = pop_epoch(EEG);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

EEG = pop_rmbase(EEG);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

EEG = pop_plotdata(EEG);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

EEG = pop_runica(EEG);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);




