%uses function 'eeg_sound_coh' to calculate coherence between EEG trials and random sounds
%first .mat variable contains EEG spectrograms
%second .mat variable contains sound spectrograms


clearvars;
tic
load('Spectrograms_without_500ms.mat');
load('Sound_spectrograms.mat');
toc
t1=toc

C_phase_rand=zeros(size(Spects,1),size(Spects,2),size(Spects,3),size(Spects,4),size(Spects,5),100);

tic
parfor i=1:100
    Soundspects_rand=Soundspects(randperm(80),:,:);
    temp=eeg_sound_coh(Spects,Soundspects_rand);
    C_phase_rand(:,:,:,:,:,i)=temp;
end
toc

t2=toc
