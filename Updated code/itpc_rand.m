%uses function 'itpc' to calculate phase coherence between random EEG trials 

clearvars;
tic
load("Spectrograms_without_500ms.mat");     %load EEG spectrograms
Spects2=reshape(Spects,21,32,320,50,76);
toc
t1=toc
C_phase_rand=zeros(size(Spects,1),size(Spects,2),size(Spects,3),6,size(Spects,5),100);

tic
parfor i=1:100                                        %randomise 100 times
    Spects_rand=Spects2(:,:,randperm(320),:,:);       %permute spectrogram by trial
    Spects_rand=reshape(Spects_rand,21,32,80,4,50,76);
    temp=itpc(Spects_rand);                           %compute phase coherence across trials
    C_phase_rand(:,:,:,:,:,i)=temp;    
end
toc

t2=toc
