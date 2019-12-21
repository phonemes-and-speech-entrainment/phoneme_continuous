%uses function 'eeg_sound_coh' to calculate coherence between EEG trials and random sounds
%first .mat variable contains randomised EEG spectrograms
%second .mat variable contains sound spectrograms

clearvars;

load('Spectrograms_rand_without_500ms.mat');
load('Soundspects_no_envelope.mat');

Random_c_phase=eeg_sound_coh(Spects_rand,Soundspects);

