clear all; clc;
addpath('\\ads.bris.ac.uk\filestore\MyFiles\StudentPG3\mc14237\Documents\Documents\eeglab_current\eeglab13_6_5b');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; % start EEGLAB under Matlab 


files = dir('*.set');
for file = files'
EEG = pop_loadset( file.name, '\\ads.bris.ac.uk\filestore\MyFiles\StudentPG3\mc14237\Documents\Neural_entrainment_to_native_and_foreign_speech\good_sets'); % read in the dataset
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG); % copy it to ALLEEG
end

l=size(ALLEEG,2);

Data_all=NaN(l,32,2000,80,4);
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


C_phase_engs=NaN(l,size(Data_all,2),6,length(F));
C_phase_engw=NaN(l,size(Data_all,2),6,length(F));
C_phase_russ=NaN(l,size(Data_all,2),6,length(F));
C_phase_rusw=NaN(l,size(Data_all,2),6,length(F));
%C_phase_rusw=NaN(l,size(Data_all,2),6,length(F));
%C_phase_rusw_rand=NaN(l,size(Data_all,2),6,length(F));


for i=1:l
    temp1=reshape(Spects_all(i,:,:,:,:),size(Spects_all,2),size(Spects_all,3),size(Spects_all,4),size(Spects_all,5),size(Spects_all,6));
    [engs,engw,russ,rusw]=itc_phase(temp1);
    %[strong_rand,weak_rand]=itc_phase_rand(temp1);
    %phase_s=strong;
    %phase_strong_rand=strong_rand;
    %phase_weak=weak;
    %phase_weak_rand=weak_rand;
    %phase_rusw=rusw;
    %phase_rusw_rand=rusw_rand;
    C_phase_engs(i,:,:,:)=engs;
    C_phase_engw(i,:,:,:)=engw;
    C_phase_russ(i,:,:,:)=russ;
    C_phase_rusw(i,:,:,:)=rusw;
    %C_phase_rusw(i,:,:,:)=phase_rusw;
    %C_phase_rusw_rand(i,:,:,:)=phase_rusw_rand;
end

C_phase_strong_rand=nanmean(C_phase_strong_rand,3);
C_phase_strong_all_rand=mean(C_phase_strong_rand);
Phstrong_rand=reshape(C_phase_strong_all_rand,size(C_phase_strong_rand,2),50);

C_phase_strong=nanmean(C_phase_strong,3);
C_phase_strong_all=mean(C_phase_strong);
Phstrong=reshape(C_phase_strong_all,size(C_phase_strong,2),50);

Strong_Itc_rand=Phstrong_rand([5,9,10,14],:);
Strong_Itc_rand=mean(Strong_Itc_rand);
Strong_Itc=Phstrong([5,9,10,14],:);
Strong_Itc=mean(Strong_Itc);

figure;
plot(F(2:end),Strong_Itc(2:end));
hold on;
plot(F(2:end),Strong_Itc_rand(2:end));
legend('Strong intra-trial','Strong inter-trial');
title('Intra- versus inter-trial coherence in the Strong condition');
xlabel('Frequency (Hz)');
ylabel('Phase coherence');


C_phase_weak_rand=nanmean(C_phase_weak_rand,3);
C_phase_weak_all_rand=mean(C_phase_weak_rand);
Phweak_rand=reshape(C_phase_weak_all_rand,size(C_phase_weak_rand,2),50);

C_phase_weak=nanmean(C_phase_weak,3);
C_phase_weak_all=mean(C_phase_weak);
Phweak=reshape(C_phase_weak_all,size(C_phase_weak,2),50);

weak_Itc_rand=Phweak_rand([5,9,10,14],:);
weak_Itc_rand=mean(weak_Itc_rand);
weak_Itc=Phweak([5,9,10,14],:);
weak_Itc=mean(weak_Itc);

figure;
plot(F(2:end),weak_Itc(2:end));
hold on;
plot(F(2:end),weak_Itc_rand(2:end));
legend('Weak intra-trial','Weak inter-trial');
title('Intra- versus inter-trial coherence in the Weak condition');
xlabel('Frequency (Hz)');
ylabel('Phase coherence');

figure;
plot(F(2:end),Strong_Itc(2:end));
hold on;
plot(F(2:end),weak_Itc_rand(2:end));
legend('Strong intra-trial','Weak intra-trial');
title('Strong versus Weak intra-trial coherenc');
xlabel('Frequency (Hz)');
ylabel('Phase coherence');




C_phase_engs_all=nanmean(C_phase_engs,3);
C_phase_engs_all=mean(C_phase_engs_all);
Phengs=reshape(C_phase_engs_all,size(C_phase_engs,2),50);
Engs_Itc=Phengs([5,9,10,14],:);
Engs_Itc=mean(Engs_Itc);

C_phase_engw_all=nanmean(C_phase_engw,3);
C_phase_engw_all=mean(C_phase_engw_all);
Phengw=reshape(C_phase_engw_all,size(C_phase_engw,2),50);
Engw_Itc=Phengw([5,9,10,14],:);
Engw_Itc=mean(Engw_Itc);

C_phase_russ_all=nanmean(C_phase_russ,3);
C_phase_russ_all=mean(C_phase_russ_all);
Phruss=reshape(C_phase_russ_all,size(C_phase_russ,2),50);
Russ_Itc=Phruss([5,9,10,14],:);
Russ_Itc=mean(Russ_Itc);

C_phase_rusw_all=nanmean(C_phase_rusw,3);
C_phase_rusw_all=mean(C_phase_rusw_all);
Phrusw=reshape(C_phase_rusw_all,size(C_phase_rusw,2),50);
Rusw_Itc=Phrusw([5,9,10,14],:);
Rusw_Itc=mean(Rusw_Itc);


figure;
plot(F(2:end),Engs_Itc(2:end));
hold on;
plot(F(2:end),Engw_Itc(2:end));
hold on;
plot(F(2:end),Russ_Itc(2:end));
hold on;
plot(F(2:end),Rusw_Itc(2:end));
legend('English strong','English weak','Russian Strong','Russian weak');
title('Inter-trial phase coherence in each condition');
xlabel('Frequency(Hz)');
ylabel('ITC values');


C_phase_engs=nanmean(C_phase_engw,3);
C_phase_engw_all=mean(C_phase_engw);
Phengw=reshape(C_phase_engw_all,size(C_phase_engw,2),50);

C_phase_engw_rand=nanmean(C_phase_engw_rand,3);
C_phase_engw_all_rand=mean(C_phase_engw_rand);
Phengw_rand=reshape(C_phase_engw_all_rand,size(C_phase_engw_rand,2),50);


C_phase_engw=nanmean(C_phase_engw,3);
C_phase_engw_all=mean(C_phase_engw);
Phengw=reshape(C_phase_engw_all,size(C_phase_engw,2),50);

C_phase_rusw_rand=nanmean(C_phase_rusw_rand,3);
C_phase_rusw_all_rand=mean(C_phase_rusw_rand);
Phrusw_rand=reshape(C_phase_rusw_all_rand,size(C_phase_rusw_rand,2),50);

C_phase_rusw=nanmean(C_phase_rusw,3);
C_phase_rusw_all=mean(C_phase_rusw);
Phrusw=reshape(C_phase_rusw_all,size(C_phase_rusw,2),50);


%%
%%
figure;
plot(F,Phengs(1,:));
hold on;
plot(F,Phengw(1,:));
hold on;
plot(F,Phruss(1,:));
hold on;
plot(F,Phrusw(1,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 1');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 1.jpg');

figure;
plot(F,Phengs(2,:));
hold on;
plot(F,Phengw(2,:));
hold on;
plot(F,Phruss(2,:));
hold on;
plot(F,Phrusw(2,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 2');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 2.jpg');

figure;
plot(F,Phengs(3,:));
hold on;
plot(F,Phengw(3,:));
hold on;
plot(F,Phruss(3,:));
hold on;
plot(F,Phrusw(3,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 3');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 3.jpg');

figure;
plot(F,Phengs(4,:));
hold on;
plot(F,Phengw(4,:));
hold on;
plot(F,Phruss(4,:));
hold on;
plot(F,Phrusw(4,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 4');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 4.jpg');

figure;
plot(F,Phengs(5,:));
hold on;
plot(F,Phengw(5,:));
hold on;
plot(F,Phruss(5,:));
hold on;
plot(F,Phrusw(5,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 5');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 5.jpg');

figure;
plot(F,Phengs(6,:));
hold on;
plot(F,Phengw(6,:));
hold on;
plot(F,Phruss(6,:));
hold on;
plot(F,Phrusw(6,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 6');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 6.jpg');

figure;
plot(F,Phengs(7,:));
hold on;
plot(F,Phengw(7,:));
hold on;
plot(F,Phruss(7,:));
hold on;
plot(F,Phrusw(7,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 7');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 7.jpg');

figure;
plot(F,Phengs(8,:));
hold on;
plot(F,Phengw(8,:));
hold on;
plot(F,Phruss(8,:));
hold on;
plot(F,Phrusw(8,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 8');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 8.jpg');

figure;
plot(F,Phengs(9,:));
hold on;
plot(F,Phengw(9,:));
hold on;
plot(F,Phruss(9,:));
hold on;
plot(F,Phrusw(9,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 9');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 9.jpg');

figure;
plot(F,Phengs(10,:));
hold on;
plot(F,Phengw(10,:));
hold on;
plot(F,Phruss(10,:));
hold on;
plot(F,Phrusw(10,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 10');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 10.jpg');

figure;
plot(F,Phengs(11,:));
hold on;
plot(F,Phengw(11,:));
hold on;
plot(F,Phruss(11,:));
hold on;
plot(F,Phrusw(11,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 11');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 11.jpg');

figure;
plot(F,Phengs(12,:));
hold on;
plot(F,Phengw(12,:));
hold on;
plot(F,Phruss(12,:));
hold on;
plot(F,Phrusw(12,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 12');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 12.jpg');

figure;
plot(F,Phengs(13,:));
hold on;
plot(F,Phengw(13,:));
hold on;
plot(F,Phruss(13,:));
hold on;
plot(F,Phrusw(13,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 13');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 13.jpg');

figure;
plot(F,Phengs(14,:));
hold on;
plot(F,Phengw(14,:));
hold on;
plot(F,Phruss(14,:));
hold on;
plot(F,Phrusw(14,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 14');
xlabel('Frequency (Hz)');
ylabel('Phase coherence(zscored)');
saveas(gcf,'zscored phase channel 14.jpg');

figure;
plot(F,Phengs(15,:));
hold on;
plot(F,Phengw(15,:));
hold on;
plot(F,Phruss(15,:));
hold on;
plot(F,Phrusw(15,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 15');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 15.jpg');

figure;
plot(F,Phengs(16,:));
hold on;
plot(F,Phengw(16,:));
hold on;
plot(F,Phruss(16,:));
hold on;
plot(F,Phrusw(16,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 16');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 16.jpg');

figure;
plot(F,Phengs(17,:));
hold on;
plot(F,Phengw(17,:));
hold on;
plot(F,Phruss(17,:));
hold on;
plot(F,Phrusw(17,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 17');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 17.jpg');

figure;
plot(F,Phengs(18,:));
hold on;
plot(F,Phengw(18,:));
hold on;
plot(F,Phruss(18,:));
hold on;
plot(F,Phrusw(18,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 18');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 18.jpg');

figure;
plot(F,Phengs(19,:));
hold on;
plot(F,Phengw(19,:));
hold on;
plot(F,Phruss(19,:));
hold on;
plot(F,Phrusw(19,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 19');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 19.jpg');

figure;
plot(F,Phengs(20,:));
hold on;
plot(F,Phengw(20,:));
hold on;
plot(F,Phruss(20,:));
hold on;
plot(F,Phrusw(20,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 20');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 20.jpg');

figure;
plot(F,Phengs(21,:));
hold on;
plot(F,Phengw(21,:));
hold on;
plot(F,Phruss(21,:));
hold on;
plot(F,Phrusw(21,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 21');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 21.jpg');

figure;
plot(F,Phengs(22,:));
hold on;
plot(F,Phengw(22,:));
hold on;
plot(F,Phruss(22,:));
hold on;
plot(F,Phrusw(22,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 22');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 22.jpg');

figure;
plot(F,Phengs(23,:));
hold on;
plot(F,Phengw(23,:));
hold on;
plot(F,Phruss(23,:));
hold on;
plot(F,Phrusw(23,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 23');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 23.jpg');


figure;
plot(F,Phengs(24,:));
hold on;
plot(F,Phengw(24,:));
hold on;
plot(F,Phruss(24,:));
hold on;
plot(F,Phrusw(24,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 24');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 24.jpg');

figure;
plot(F,Phengs(25,:));
hold on;
plot(F,Phengw(25,:));
hold on;
plot(F,Phruss(25,:));
hold on;
plot(F,Phrusw(25,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 25');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 25.jpg');

figure;
plot(F,Phengs(26,:));
hold on;
plot(F,Phengw(26,:));
hold on;
plot(F,Phruss(26,:));
hold on;
plot(F,Phrusw(26,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 26');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 26.jpg');

figure;
plot(F,Phengs(27,:));
hold on;
plot(F,Phengw(27,:));
hold on;
plot(F,Phruss(27,:));
hold on;
plot(F,Phrusw(27,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 27');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 27.jpg');

figure;
plot(F,Phengs(28,:));
hold on;
plot(F,Phengw(28,:));
hold on;
plot(F,Phruss(28,:));
hold on;
plot(F,Phrusw(28,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 28');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 28.jpg');

figure;
plot(F,Phengs(29,:));
hold on;
plot(F,Phengw(29,:));
hold on;
plot(F,Phruss(29,:));
hold on;
plot(F,Phrusw(29,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 29');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 29.jpg');


figure;
plot(F,Phengs(30,:));
hold on;
plot(F,Phengw(30,:));
hold on;
plot(F,Phruss(30,:));
hold on;
plot(F,Phrusw(30,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 30');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 30.jpg');

figure;
plot(F,Phengs(31,:));
hold on;
plot(F,Phengw(31,:));
hold on;
plot(F,Phruss(31,:));
hold on;
plot(F,Phrusw(31,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 31');
xlabel('Frequency (Hz)');
ylabel('Phase coherence(zscored)');
saveas(gcf,'zscored phase channel 31.jpg');

figure;
plot(F,Phengs(32,:));
hold on;
plot(F,Phengw(32,:));
hold on;
plot(F,Phruss(32,:));
hold on;
plot(F,Phrusw(32,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored phase coherence channel 32');
xlabel('Frequency (Hz)');
ylabel('Phase coherence (zscored)');
saveas(gcf,'zscored phase channel 32.jpg');


%%
Engw_Itc_rand=Phengw_rand([5,9,10,14],:);
Engw_Itc_rand=mean(Engw_Itc_rand);
Engw_Itc=Phengw([5,9,10,14],:);
Engw_Itc=mean(Engw_Itc);

figure;
plot(F,Engw_Itc);
hold on;
plot(F,Engw_Itc_rand);
legend('English weak intra-trial','English weak inter-trial');
title('Intra- versus inter-trial coherence in the English Weak condition');
xlabel('Frequency (Hz)');
ylabel('Phase coherence');

Rusw_Itc_rand=Phrusw_rand([5,9,10,14],:);
Rusw_Itc_rand=mean(Rusw_Itc_rand);
Rusw_Itc=Phrusw([5,9,10,14],:);
Rusw_Itc=mean(Rusw_Itc);

figure;
plot(F,Rusw_Itc);
hold on;
plot(F,Rusw_Itc_rand);
legend('Russian weak intra-trial','Russian weak inter-trial');
title('Intra- versus inter-trial coherence in the Russian Weak condition');
xlabel('Frequency (Hz)');
ylabel('Phase coherence');

figure;
plot(F,Engs_Itc);
hold on;
plot(F,Engw_Itc);
hold on;
plot(F,Russ_Itc);
hold on;
plot(F,Rusw_Itc);
legend('English Strong','English Weak','Russian Strong','Russian weak');

Phengs_theta31=C_phase_engs(:,31,:,5:13);
Phengw_theta31=C_phase_engw(:,31,:,5:13);
Phruss_theta31=C_phase_russ(:,31,:,5:13);
Phrusw_theta31=C_phase_rusw(:,31,:,5:13);


Phengs_theta31=mean(Phengs_theta31,2);
Phengs_theta31=mean(Phengs_theta31,4);

Phengw_theta31=mean(Phengw_theta31,2);
Phengw_theta31=mean(Phengw_theta31,4);

Phruss_theta31=mean(Phruss_theta31,2);
Phruss_theta31=mean(Phruss_theta31,4);

Phrusw_theta31=mean(Phrusw_theta31,2);
Phrusw_theta31=mean(Phrusw_theta31,4);

Theta_Itc31=[Phengs_theta31,Phengw_theta31,Phruss_theta31,Phrusw_theta31];

Phengs_theta17=C_phase_engs(:,17,:,5:13);
Phengw_theta17=C_phase_engw(:,17,:,5:13);
Phruss_theta17=C_phase_russ(:,17,:,5:13);
Phrusw_theta17=C_phase_rusw(:,17,:,5:13);


Phengs_theta17=mean(Phengs_theta17,2);
Phengs_theta17=mean(Phengs_theta17,4);

Phengw_theta17=mean(Phengw_theta17,2);
Phengw_theta17=mean(Phengw_theta17,4);

Phruss_theta17=mean(Phruss_theta17,2);
Phruss_theta17=mean(Phruss_theta17,4);

Phrusw_theta17=mean(Phrusw_theta17,2);
Phrusw_theta17=mean(Phrusw_theta17,4);

Theta_Itc17=[Phengs_theta17,Phengw_theta17,Phruss_theta17,Phrusw_theta17];

Phengs_theta30=C_phase_engs(:,30,:,5:13);
Phengw_theta30=C_phase_engw(:,30,:,5:13);
Phruss_theta30=C_phase_russ(:,30,:,5:13);
Phrusw_theta30=C_phase_rusw(:,30,:,5:13);

Phengs_theta30=mean(Phengs_theta30,2);
Phengs_theta30=mean(Phengs_theta30,4);

Phengw_theta30=mean(Phengw_theta30,2);
Phengw_theta30=mean(Phengw_theta30,4);

Phruss_theta30=mean(Phruss_theta30,2);
Phruss_theta30=mean(Phruss_theta30,4);

Phrusw_theta30=mean(Phrusw_theta30,2);
Phrusw_theta30=mean(Phrusw_theta30,4);

Theta_Itc30=[Phengs_theta30,Phengw_theta30,Phruss_theta30,Phrusw_theta30];

Phengs_alpha31=C_phase_engs(:,31,:,16:22);
Phengw_alpha31=C_phase_engw(:,31,:,16:22);
Phruss_alpha31=C_phase_russ(:,31,:,16:22);
Phrusw_alpha31=C_phase_rusw(:,31,:,16:22);


Phengs_alpha31=mean(Phengs_alpha31,2);
Phengs_alpha31=mean(Phengs_alpha31,4);

Phengw_alpha31=mean(Phengw_alpha31,2);
Phengw_alpha31=mean(Phengw_alpha31,4);

Phruss_alpha31=mean(Phruss_alpha31,2);
Phruss_alpha31=mean(Phruss_alpha31,4);

Phrusw_alpha31=mean(Phrusw_alpha31,2);
Phrusw_alpha31=mean(Phrusw_alpha31,4);

Alpha_Itc31=[Phengs_alpha31,Phengw_alpha31,Phruss_alpha31,Phrusw_alpha31];

Phengs_alpha17=C_phase_engs(:,17,:,16:22);
Phengw_alpha17=C_phase_engw(:,17,:,16:22);
Phruss_alpha17=C_phase_russ(:,17,:,16:22);
Phrusw_alpha17=C_phase_rusw(:,17,:,16:22);


Phengs_alpha17=mean(Phengs_alpha17,2);
Phengs_alpha17=mean(Phengs_alpha17,4);

Phengw_alpha17=mean(Phengw_alpha17,2);
Phengw_alpha17=mean(Phengw_alpha17,4);

Phruss_alpha17=mean(Phruss_alpha17,2);
Phruss_alpha17=mean(Phruss_alpha17,4);

Phrusw_alpha17=mean(Phrusw_alpha17,2);
Phrusw_alpha17=mean(Phrusw_alpha17,4);

Alpha_Itc17=[Phengs_alpha17,Phengw_alpha17,Phruss_alpha17,Phrusw_alpha17];

Phengs_alpha13=C_phase_engs(:,13,:,16:22);
Phengw_alpha13=C_phase_engw(:,13,:,16:22);
Phruss_alpha13=C_phase_russ(:,13,:,16:22);
Phrusw_alpha13=C_phase_rusw(:,13,:,16:22);


Phengs_alpha13=mean(Phengs_alpha13,2);
Phengs_alpha13=mean(Phengs_alpha13,4);

Phengw_alpha13=mean(Phengw_alpha13,2);
Phengw_alpha13=mean(Phengw_alpha13,4);

Phruss_alpha13=mean(Phruss_alpha13,2);
Phruss_alpha13=mean(Phruss_alpha13,4);

Phrusw_alpha13=mean(Phrusw_alpha13,2);
Phrusw_alpha13=mean(Phrusw_alpha13,4);

Alpha_Itc13=[Phengs_alpha13,Phengw_alpha13,Phruss_alpha13,Phrusw_alpha13];


Phengs_alpha=C_phase_engs(:,[5 9 10 14],:,16:22);
Phengw_alpha=C_phase_engw(:,[5 9 10 14],:,16:22);
Phruss_alpha=C_phase_russ(:,[5 9 10 14],:,16:22);
Phrusw_alpha=C_phase_rusw(:,[5 9 10 14],:,16:22);


Phengs_alpha=mean(Phengs_alpha,2);
Phengs_alpha=mean(Phengs_alpha,4);

Phengw_alpha=mean(Phengw_alpha,2);
Phengw_alpha=mean(Phengw_alpha,4);

Phruss_alpha=mean(Phruss_alpha,2);
Phruss_alpha=mean(Phruss_alpha,4);

Phrusw_alpha=mean(Phrusw_alpha,2);
Phrusw_alpha=mean(Phrusw_alpha,4);

Alpha_Itc=[Phengs_alpha,Phengw_alpha,Phruss_alpha,Phrusw_alpha];

p2=anova1(Alpha_Itc);


Phengs_gamma17=C_phase_engs(:,17,:,35:50);
Phengw_gamma17=C_phase_engw(:,17,:,35:50);
Phruss_gamma17=C_phase_russ(:,17,:,35:50);
Phrusw_gamma17=C_phase_rusw(:,17,:,35:50);


Phengs_gamma17=mean(Phengs_gamma17,2);
Phengs_gamma17=mean(Phengs_gamma17,4);

Phengw_gamma17=mean(Phengw_gamma17,2);
Phengw_gamma17=mean(Phengw_gamma17,4);

Phruss_gamma17=mean(Phruss_gamma17,2);
Phruss_gamma17=mean(Phruss_gamma17,4);

Phrusw_gamma17=mean(Phrusw_gamma17,2);
Phrusw_gamma17=mean(Phrusw_gamma17,4);

Gamma_Itc17=[Phengs_gamma17,Phengw_gamma17,Phruss_gamma17,Phrusw_gamma17];

Phengs_gamma12=C_phase_engs(:,12,:,35:50);
Phengw_gamma12=C_phase_engw(:,12,:,35:50);
Phruss_gamma12=C_phase_russ(:,12,:,35:50);
Phrusw_gamma12=C_phase_rusw(:,12,:,35:50);


Phengs_gamma12=mean(Phengs_gamma12,2);
Phengs_gamma12=mean(Phengs_gamma12,4);

Phengw_gamma12=mean(Phengw_gamma12,2);
Phengw_gamma12=mean(Phengw_gamma12,4);

Phruss_gamma12=mean(Phruss_gamma12,2);
Phruss_gamma12=mean(Phruss_gamma12,4);

Phrusw_gamma12=mean(Phrusw_gamma12,2);
Phrusw_gamma12=mean(Phrusw_gamma12,4);

Gamma_Itc12=[Phengs_gamma12,Phengw_gamma12,Phruss_gamma12,Phrusw_gamma12];

Phengs_gamma3=C_phase_engs(:,3,:,35:50);
Phengw_gamma3=C_phase_engw(:,3,:,35:50);
Phruss_gamma3=C_phase_russ(:,3,:,35:50);
Phrusw_gamma3=C_phase_rusw(:,3,:,35:50);


Phengs_gamma3=mean(Phengs_gamma3,2);
Phengs_gamma3=mean(Phengs_gamma3,4);

Phengw_gamma3=mean(Phengw_gamma3,2);
Phengw_gamma3=mean(Phengw_gamma3,4);

Phruss_gamma3=mean(Phruss_gamma3,2);
Phruss_gamma3=mean(Phruss_gamma3,4);

Phrusw_gamma3=mean(Phrusw_gamma3,2);
Phrusw_gamma3=mean(Phrusw_gamma3,4);

Gamma_Itc3=[Phengs_gamma3,Phengw_gamma3,Phruss_gamma3,Phrusw_gamma3];


Phengs_gamma=C_phase_engs(:,[5 9 10 14],:,35:50);
Phengw_gamma=C_phase_engw(:,[5 9 10 14],:,35:50);
Phruss_gamma=C_phase_russ(:,[5 9 10 14],:,35:50);
Phrusw_gamma=C_phase_rusw(:,[5 9 10 14],:,35:50);


Phengs_gamma=mean(Phengs_gamma,2);
Phengs_gamma=mean(Phengs_gamma,4);

Phengw_gamma=mean(Phengw_gamma,2);
Phengw_gamma=mean(Phengw_gamma,4);

Phruss_gamma=mean(Phruss_gamma,2);
Phruss_gamma=mean(Phruss_gamma,4);

Phrusw_gamma=mean(Phrusw_gamma,2);
Phrusw_gamma=mean(Phrusw_gamma,4);

Gamma_Itc=[Phengs_gamma,Phengw_gamma,Phruss_gamma,Phrusw_gamma];

p3=anova1(Gamma_Itc);

Theta=mean(Theta_Itc,2);
Alpha=mean(Alpha_Itc,2);
Gamma=mean(Gamma_Itc,2);

All=[Theta,Alpha,Gamma];
p4=anova1(All);


conditions = {'English Strong', 'English Weak', 'Russian Strong', 'Russian Weak'};

figure;
hold on;
bar(mean(Alpha_Itc13));
errorbar(mean(Alpha_Itc13),std(Alpha_Itc13,0,1),'.');
set(gca,'Xtick',1:4,'Xticklabel',conditions);
ylabel('Phase coherence (zscored)');
title('Zscored phase coherence Alpha channel 13 (C3)');
saveas(gcf,'phase_alpha_13.jpg');

figure;
hold on;
bar(mean(Alpha_Itc17));
errorbar(mean(Alpha_Itc17),std(Alpha_Itc17,0,1),'.');
set(gca,'Xtick',1:4,'Xticklabel',conditions);
ylabel('Phase coherence (zscored)');
title('Zscored phase coherence Alpha channel 17 (TP9)');
saveas(gcf,'phase_alpha_17.jpg');

figure;
hold on;
bar(mean(Alpha_Itc31));
errorbar(mean(Alpha_Itc31),std(Alpha_Itc31,0,1),'.');
set(gca,'Xtick',1:4,'Xticklabel',conditions);
ylabel('Phase coherence (zscored)');
title('Zscored phase coherence Alpha channel 31 (TP9)');
saveas(gcf,'phase_alpha_31.jpg');






