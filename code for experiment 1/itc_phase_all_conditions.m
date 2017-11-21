%% first bit
addpath('\\ads.bris.ac.uk\filestore\MyFiles\StudentPG3\mc14237\Documents\Documents\eeglab_current\eeglab13_6_5b');
addpath('\\ads.bris.ac.uk\filestore\MyFiles\StudentPG3\mc14237\Documents\Documents\code for experiment 1');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; % start EEGLAB under Matlab 


files = dir('*.set');
for file = files'
EEG = pop_loadset( file.name, '\\ads.bris.ac.uk\filestore\MyFiles\StudentPG3\mc14237\Documents\Neural_entrainment_to_native_and_foreign_speech\good_sets'); % read in the dataset
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG); % copy it to ALLEEG
end

l=size(ALLEEG,2);

Data_all=NaN(l,32,2000,100,4);
for i=1:l
    Data_all(i,:,:,:,:)=get_chan_all_subjects(ALLEEG,i);
end


F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];

Spects_all=NaN(size(Data_all,1),size(Data_all,2),size(Data_all,4),size(Data_all,5),length(F),11);

for i=1:l
    temp=reshape(Data_all(i,:,:,:,:),size(Data_all,2),size(Data_all,3),size(Data_all,4),size(Data_all,5));
    Spects_all(i,:,:,:,:,:)=getspects(temp);
end

%% coherence 
C_phase=NaN(l,size(Data_all,2),size(Data_all,4),length(F));
C_phase_rand=NaN(l,size(Data_all,2),size(Data_all,4),length(F));

for i=1:l
    temp1=reshape(Spects_all(i,:,:,:,:),size(Spects_all,2),size(Spects_all,3),size(Spects_all,4),size(Spects_all,5),size(Spects_all,6));
    phase_coh=itc_phase_all(temp1);
    phase_coh_rand=itc_phase_rand_all(temp1);
    temp2=phase_coh;
    temp3=phase_coh_rand;    
    temp2=reshape(temp2,1,size(phase_coh,1),size(phase_coh,2),size(phase_coh,3));
    temp3=reshape(temp3,1,size(phase_coh_rand,1),size(phase_coh_rand,2),size(phase_coh_rand,3));
    C_phase(i,:,:,:)=temp2;
    C_phase_rand(i,:,:,:)=temp3;
end
    
C_phase=nanmean(C_phase,3);
%dev=std(C_phase_rand,0,3);
C_phase_rand=nanmean(C_phase_rand,3);

%Phase_diff=(C_phase-C_phase_rand)./dev;
%Phase_diff_midline=Phase_diff(:,[5 9 10 4],:);
%Phase_diff_midline=mean(mean(Phase_diff_midline,2));
%Phase_diff_midline=squeeze(Phase_diff_midline);

%figure;
%plot(F,Phase_diff_midline);
%title('Zscored phase ITC');
%xlabel('Frequency (Hz)');
%ylabel('Phase coherence');


C_phase_midline=C_phase(:,[5 9 10 4],:);
C_phase_midline=mean(mean(C_phase_midline,2));
C_phase_midline=squeeze(C_phase_midline);
%C_phase_midline=mean(C_phase_midline);


C_phase_rand_midline=C_phase_rand(:,[5 9 10 14],:);
C_phase_rand_midline=mean(mean(C_phase_rand_midline,2));
C_phase_rand_midline=squeeze(C_phase_rand_midline);
%C_phase_rand_midline=mean(C_phase_rand_midline);

figure;
plot(F(3:end),C_phase_midline(3:end));
hold on;
plot(F(3:end),C_phase_rand_midline(3:end));
legend('Intra-trial phase coherence','Inter-trial phase coherence');
title('Intra- vs Inter-trial phase coherence at midline electrodes, averaged across conditions');
xlabel('Frequency (Hz)');
ylabel('Phase coherence');


C_phase_all=mean(C_phase);
C_phase_all=reshape(C_phase_all,size(C_phase,2),50);

C_phase_theta=mean(C_phase_all(:,5:13),2);
C_phase_alpha=mean(C_phase_all(:,16:22),2);
C_phase_gamma=mean(C_phase_all(:,35:50),2);

[Alpha,I_alpha]=sort(C_phase_alpha,'ascend');
[Theta,I_theta]=sort(C_phase_theta,'ascend');
[Gamma,I_gamma]=sort(C_phase_gamma,'ascend');

