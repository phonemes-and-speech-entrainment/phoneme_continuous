clearvars;

load('Spectrograms_rand_without_500ms.mat');
load('Soundspects_no_envelope.mat');

Random_c_phase=eeg_sound_coh(Spects_rand,Soundspects);

