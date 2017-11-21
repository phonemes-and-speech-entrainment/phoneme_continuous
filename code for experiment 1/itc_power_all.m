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

%%
C_phase_eng=NaN(l,size(Data_all,2),6,length(F));
C_phase_eng_rand=NaN(l,size(Data_all,2),6,length(F));
C_phase_rus=NaN(l,size(Data_all,2),6,length(F));
C_phase_rus_rand=NaN(l,size(Data_all,2),6,length(F));


for i=1:l
    temp1=reshape(Spects_all(i,:,:,:,:),size(Spects_all,2),size(Spects_all,3),size(Spects_all,4),size(Spects_all,5),size(Spects_all,6));
    [eng,rus]=itc_power(temp1);
    [eng_rand,rus_rand]=itc_power_rand(temp1);
    %phase_engs=(engs-engs_rand)./sengs;
    %phase_engw=(engw-engw_rand)./sengw;
    %phase_russ=(russ-russ_rand)./sruss;
    %phase_russ_rand=(rusw-rusw_rand)./srusw;
    C_phase_eng(i,:,:,:)=eng;
    C_phase_eng_rand(i,:,:,:)=eng_rand;
    C_phase_rus(i,:,:,:)=rus;
    C_phase_rus_rand(i,:,:,:)=rus_rand;
end

C_phase_eng=nanmean(C_phase_eng,3);
C_phase_eng_all=nanmean(C_phase_eng);
Pheng=reshape(C_phase_eng_all,size(C_phase_engs,2),50);


C_phase_eng_rand=nanmean(C_phase_eng_rand,3);
C_phase_eng_rand_all=nanmean(C_phase_eng_rand);
Pheng_rand=reshape(C_phase_eng_rand_all,size(C_phase_eng_rand,2),50);

C_phase_rus=nanmean(C_phase_rus,3);
C_phase_rus_all=nanmean(C_phase_rus);
Phrus=reshape(C_phase_rus_all,size(C_phase_rus,2),50);

C_phase_rus_rand=nanmean(C_phase_rus_rand,3);
C_phase_rus_rand_all=nanmean(C_phase_rus_rand);
Phrus_rand=reshape(C_phase_rus_rand_all,size(C_phase_rus_rand,2),50);

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
title('zscored power covariance channel 1');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 1.jpg');

figure;
plot(F,Phengs(2,:));
hold on;
plot(F,Phengw(2,:));
hold on;
plot(F,Phruss(2,:));
hold on;
plot(F,Phrusw(2,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 2');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 2.jpg');

figure;
plot(F,Phengs(3,:));
hold on;
plot(F,Phengw(3,:));
hold on;
plot(F,Phruss(3,:));
hold on;
plot(F,Phrusw(3,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 3');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 3.jpg');

figure;
plot(F,Phengs(4,:));
hold on;
plot(F,Phengw(4,:));
hold on;
plot(F,Phruss(4,:));
hold on;
plot(F,Phrusw(4,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 4');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 4.jpg');

figure;
plot(F,Phengs(5,:));
hold on;
plot(F,Phengw(5,:));
hold on;
plot(F,Phruss(5,:));
hold on;
plot(F,Phrusw(5,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 5');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 5.jpg');

figure;
plot(F,Phengs(6,:));
hold on;
plot(F,Phengw(6,:));
hold on;
plot(F,Phruss(6,:));
hold on;
plot(F,Phrusw(6,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 6');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 6.jpg');

figure;
plot(F,Phengs(7,:));
hold on;
plot(F,Phengw(7,:));
hold on;
plot(F,Phruss(7,:));
hold on;
plot(F,Phrusw(7,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 7');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 7.jpg');

figure;
plot(F,Phengs(8,:));
hold on;
plot(F,Phengw(8,:));
hold on;
plot(F,Phruss(8,:));
hold on;
plot(F,Phrusw(8,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 8');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 8.jpg');

figure;
plot(F,Phengs(9,:));
hold on;
plot(F,Phengw(9,:));
hold on;
plot(F,Phruss(9,:));
hold on;
plot(F,Phrusw(9,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 9');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 9.jpg');

figure;
plot(F,Phengs(10,:));
hold on;
plot(F,Phengw(10,:));
hold on;
plot(F,Phruss(10,:));
hold on;
plot(F,Phrusw(10,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 10');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 10.jpg');

figure;
plot(F,Phengs(11,:));
hold on;
plot(F,Phengw(11,:));
hold on;
plot(F,Phruss(11,:));
hold on;
plot(F,Phrusw(11,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 11');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 11.jpg');

figure;
plot(F,Phengs(12,:));
hold on;
plot(F,Phengw(12,:));
hold on;
plot(F,Phruss(12,:));
hold on;
plot(F,Phrusw(12,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 12');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 12.jpg');

figure;
plot(F,Phengs(13,:));
hold on;
plot(F,Phengw(13,:));
hold on;
plot(F,Phruss(13,:));
hold on;
plot(F,Phrusw(13,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 13');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 13.jpg');

figure;
plot(F,Phengs(14,:));
hold on;
plot(F,Phengw(14,:));
hold on;
plot(F,Phruss(14,:));
hold on;
plot(F,Phrusw(14,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 14');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 14.jpg');

figure;
plot(F,Phengs(15,:));
hold on;
plot(F,Phengw(15,:));
hold on;
plot(F,Phruss(15,:));
hold on;
plot(F,Phrusw(15,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 15');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 15.jpg');

figure;
plot(F,Phengs(16,:));
hold on;
plot(F,Phengw(16,:));
hold on;
plot(F,Phruss(16,:));
hold on;
plot(F,Phrusw(16,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 16');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 16.jpg');

figure;
plot(F,Phengs(17,:));
hold on;
plot(F,Phengw(17,:));
hold on;
plot(F,Phruss(17,:));
hold on;
plot(F,Phrusw(17,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 17');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 17.jpg');

figure;
plot(F,Phengs(18,:));
hold on;
plot(F,Phengw(18,:));
hold on;
plot(F,Phruss(18,:));
hold on;
plot(F,Phrusw(18,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 18');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 18.jpg');

figure;
plot(F,Phengs(19,:));
hold on;
plot(F,Phengw(19,:));
hold on;
plot(F,Phruss(19,:));
hold on;
plot(F,Phrusw(19,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 19');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 19.jpg');

figure;
plot(F,Phengs(20,:));
hold on;
plot(F,Phengw(20,:));
hold on;
plot(F,Phruss(20,:));
hold on;
plot(F,Phrusw(20,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 20');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 20.jpg');

figure;
plot(F,Phengs(21,:));
hold on;
plot(F,Phengw(21,:));
hold on;
plot(F,Phruss(21,:));
hold on;
plot(F,Phrusw(21,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 21');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 21.jpg');

figure;
plot(F,Phengs(22,:));
hold on;
plot(F,Phengw(22,:));
hold on;
plot(F,Phruss(22,:));
hold on;
plot(F,Phrusw(22,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 22');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 22.jpg');

figure;
plot(F,Phengs(23,:));
hold on;
plot(F,Phengw(23,:));
hold on;
plot(F,Phruss(23,:));
hold on;
plot(F,Phrusw(23,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 23');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 23.jpg');

figure;
plot(F,Phengs(24,:));
hold on;
plot(F,Phengw(24,:));
hold on;
plot(F,Phruss(24,:));
hold on;
plot(F,Phrusw(24,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 24');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 24.jpg');

figure;
plot(F,Phengs(25,:));
hold on;
plot(F,Phengw(25,:));
hold on;
plot(F,Phruss(25,:));
hold on;
plot(F,Phrusw(25,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 25');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 25.jpg');

figure;
plot(F,Phengs(26,:));
hold on;
plot(F,Phengw(26,:));
hold on;
plot(F,Phruss(26,:));
hold on;
plot(F,Phrusw(26,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 26');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 26.jpg');

figure;
plot(F,Phengs(27,:));
hold on;
plot(F,Phengw(27,:));
hold on;
plot(F,Phruss(27,:));
hold on;
plot(F,Phrusw(27,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 27');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 27.jpg');

figure;
plot(F,Phengs(28,:));
hold on;
plot(F,Phengw(28,:));
hold on;
plot(F,Phruss(28,:));
hold on;
plot(F,Phrusw(28,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 28');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 28.jpg');

figure;
plot(F,Phengs(29,:));
hold on;
plot(F,Phengw(29,:));
hold on;
plot(F,Phruss(29,:));
hold on;
plot(F,Phrusw(29,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 29');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 29.jpg');


figure;
plot(F,Phengs(30,:));
hold on;
plot(F,Phengw(30,:));
hold on;
plot(F,Phruss(30,:));
hold on;
plot(F,Phrusw(30,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 30');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 30.jpg');

figure;
plot(F,Phengs(31,:));
hold on;
plot(F,Phengw(31,:));
hold on;
plot(F,Phruss(31,:));
hold on;
plot(F,Phrusw(31,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 31');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 31.jpg');

figure;
plot(F,Phengs(32,:));
hold on;
plot(F,Phengw(32,:));
hold on;
plot(F,Phruss(32,:));
hold on;
plot(F,Phrusw(32,:));
legend('english strong','english weak','russian strong','russian weak');
title('zscored power covariance channel 32');
xlabel('Frequency (Hz)');
ylabel('Power covariance (zscored)');
saveas(gcf,'zscored power channel 32.jpg');
%%
%Engs_Itc=Phengs([5,9,10,14],:);
%Engs_Itc=mean(Engs_Itc);
%Engw_Itc=Phengw([5,9,10,14],:);
%Engw_Itc=mean(Engw_Itc);
Rus_Itc=Phrus([5,9,10,14],:);
Rus_Itc=mean(Rus_Itc);
Rus_Itc_rand=Phrus_rand([5,9,10,14],:);
Rus_Itc_rand=mean(Rus_Itc_rand);

figure;
%plot(F,Engs_Itc);
%hold on;
%plot(F,Engw_Itc);
%hold on;
plot(F(3:end),Rus_Itc(3:end));
hold on;
plot(F(3:end),Rus_Itc_rand(3:end));
legend('Intra-trial power covariance Russian','Inter-trial power covariance Russian');
title('Intra- vs Inter-trial power covariance - Russian');
xlabel('Frequency(Hz)');
ylabel('Power covariance');

Eng_Itc=Pheng([5,9,10,14],:);
Eng_Itc=mean(Eng_Itc);
Eng_Itc_rand=Pheng_rand([5,9,10,14],:);
Eng_Itc_rand=mean(Eng_Itc_rand);

figure;
plot(F(3:end),Eng_Itc(3:end));
hold on;
plot(F(3:end),Eng_Itc_rand(3:end));
legend('Intra-trial power covariance English','Inter-trial power covariance English');
title('Intra- vs Inter-trial power covariance - English');
xlabel('Frequency(Hz)');
ylabel('Power covariance');

%%
Phengs_theta29=C_phase_engs(:,29,:,5:13);
Phengw_theta29=C_phase_engw(:,29,:,5:13);
Phruss_theta29=C_phase_russ(:,29,:,5:13);
Phrusw_theta29=C_phase_rusw(:,29,:,5:13);

Phengs_theta29=mean(Phengs_theta29,2);
Phengs_theta29=mean(Phengs_theta29,4);

Phengw_theta29=mean(Phengw_theta29,2);
Phengw_theta29=mean(Phengw_theta29,4);

Phruss_theta29=mean(Phruss_theta29,2);
Phruss_theta29=mean(Phruss_theta29,4);

Phrusw_theta29=mean(Phrusw_theta29,2);
Phrusw_theta29=mean(Phrusw_theta29,4);

Theta_Itc29=[Phengs_theta29,Phengw_theta29,Phruss_theta29,Phrusw_theta29];

Phengs_theta6=C_phase_engs(:,6,:,5:13);
Phengw_theta6=C_phase_engw(:,6,:,5:13);
Phruss_theta6=C_phase_russ(:,6,:,5:13);
Phrusw_theta6=C_phase_rusw(:,6,:,5:13);


Phengs_theta6=mean(Phengs_theta6,2);
Phengs_theta6=mean(Phengs_theta6,4);

Phengw_theta6=mean(Phengw_theta6,2);
Phengw_theta6=mean(Phengw_theta6,4);

Phruss_theta6=mean(Phruss_theta6,2);
Phruss_theta6=mean(Phruss_theta6,4);

Phrusw_theta6=mean(Phrusw_theta6,2);
Phrusw_theta6=mean(Phrusw_theta6,4);

Theta_Itc6=[Phengs_theta6,Phengw_theta6,Phruss_theta6,Phrusw_theta6];

Phengs_theta21=C_phase_engs(:,21,:,5:13);
Phengw_theta21=C_phase_engw(:,21,:,5:13);
Phruss_theta21=C_phase_russ(:,21,:,5:13);
Phrusw_theta21=C_phase_rusw(:,21,:,5:13);

Phengs_theta21=mean(Phengs_theta21,2);
Phengs_theta21=mean(Phengs_theta21,4);

Phengw_theta21=mean(Phengw_theta21,2);
Phengw_theta21=mean(Phengw_theta21,4);

Phruss_theta21=mean(Phruss_theta21,2);
Phruss_theta21=mean(Phruss_theta21,4);

Phrusw_theta21=mean(Phrusw_theta21,2);
Phrusw_theta21=mean(Phrusw_theta21,4);

Theta_Itc21=[Phengs_theta21,Phengw_theta21,Phruss_theta21,Phrusw_theta21];

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

Phengs_alpha30=C_phase_engs(:,30,:,16:22);
Phengw_alpha30=C_phase_engw(:,30,:,16:22);
Phruss_alpha30=C_phase_russ(:,30,:,16:22);
Phrusw_alpha30=C_phase_rusw(:,30,:,16:22);


Phengs_alpha30=mean(Phengs_alpha30,2);
Phengs_alpha30=mean(Phengs_alpha30,4);

Phengw_alpha30=mean(Phengw_alpha30,2);
Phengw_alpha30=mean(Phengw_alpha30,4);

Phruss_alpha30=mean(Phruss_alpha30,2);
Phruss_alpha30=mean(Phruss_alpha30,4);

Phrusw_alpha30=mean(Phrusw_alpha30,2);
Phrusw_alpha30=mean(Phrusw_alpha30,4);

Alpha_Itc30=[Phengs_alpha30,Phengw_alpha30,Phruss_alpha30,Phrusw_alpha30];

Phengs_alpha29=C_phase_engs(:,29,:,16:22);
Phengw_alpha29=C_phase_engw(:,29,:,16:22);
Phruss_alpha29=C_phase_russ(:,29,:,16:22);
Phrusw_alpha29=C_phase_rusw(:,29,:,16:22);


Phengs_alpha29=mean(Phengs_alpha29,2);
Phengs_alpha29=mean(Phengs_alpha29,4);

Phengw_alpha29=mean(Phengw_alpha29,2);
Phengw_alpha29=mean(Phengw_alpha29,4);

Phruss_alpha29=mean(Phruss_alpha29,2);
Phruss_alpha29=mean(Phruss_alpha29,4);

Phrusw_alpha29=mean(Phrusw_alpha29,2);
Phrusw_alpha29=mean(Phrusw_alpha29,4);

Alpha_Itc29=[Phengs_alpha29,Phengw_alpha29,Phruss_alpha29,Phrusw_alpha29];


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

Phengs_gamma4=C_phase_engs(:,4,:,35:50);
Phengw_gamma4=C_phase_engw(:,4,:,35:50);
Phruss_gamma4=C_phase_russ(:,4,:,35:50);
Phrusw_gamma4=C_phase_rusw(:,4,:,35:50);


Phengs_gamma4=mean(Phengs_gamma4,2);
Phengs_gamma4=mean(Phengs_gamma4,4);

Phengw_gamma4=mean(Phengw_gamma4,2);
Phengw_gamma4=mean(Phengw_gamma4,4);

Phruss_gamma4=mean(Phruss_gamma4,2);
Phruss_gamma4=mean(Phruss_gamma4,4);

Phrusw_gamma4=mean(Phrusw_gamma4,2);
Phrusw_gamma4=mean(Phrusw_gamma4,4);

Gamma_Itc4=[Phengs_gamma4,Phengw_gamma4,Phruss_gamma4,Phrusw_gamma4];

Phengs_gamma27=C_phase_engs(:,27,:,35:50);
Phengw_gamma27=C_phase_engw(:,27,:,35:50);
Phruss_gamma27=C_phase_russ(:,27,:,35:50);
Phrusw_gamma27=C_phase_rusw(:,27,:,35:50);


Phengs_gamma27=mean(Phengs_gamma27,2);
Phengs_gamma27=mean(Phengs_gamma27,4);

Phengw_gamma27=mean(Phengw_gamma27,2);
Phengw_gamma27=mean(Phengw_gamma27,4);

Phruss_gamma27=mean(Phruss_gamma27,2);
Phruss_gamma27=mean(Phruss_gamma27,4);

Phrusw_gamma27=mean(Phrusw_gamma27,2);
Phrusw_gamma27=mean(Phrusw_gamma27,4);

Gamma_Itc27=[Phengs_gamma27,Phengw_gamma27,Phruss_gamma27,Phrusw_gamma27];

%%
Phengs_theta=C_phase_engs(:,[5 9 10 14],:,5:13);
Phengw_theta=C_phase_engw(:,[5 9 10 14],:,5:13);
Phruss_theta=C_phase_russ(:,[5 9 10 14],:,5:13);
Phrusw_theta=C_phase_rusw(:,[5 9 10 14],:,5:13);


Phengs_theta=mean(Phengs_theta,2);
Phengs_theta=mean(Phengs_theta,4);

Phengw_theta=mean(Phengw_theta,2);
Phengw_theta=mean(Phengw_theta,4);

Phruss_theta=mean(Phruss_theta,2);
Phruss_theta=mean(Phruss_theta,4);

Phrusw_theta=mean(Phrusw_theta,2);
Phrusw_theta=mean(Phrusw_theta,4);

Theta_Itc=[Phengs_theta,Phengw_theta,Phruss_theta,Phrusw_theta];

p1=anova1(Theta_Itc);

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