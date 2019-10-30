clearvars;

load('EEG_sound_coherence2.mat');

F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];

mean_itc=squeeze(mean(C_phase_sound,4));

itc_engs=mean_itc(:,:,1:20,:);
itc_engw=mean_itc(:,:,21:40,:);
itc_russ=mean_itc(:,:,41:60,:);
itc_rusw=mean_itc(:,:,61:80,:);

mean_engs=squeeze(mean(mean(mean(itc_engs,1),2),3));
mean_engw=squeeze(mean(mean(mean(itc_engw,1),2),3));
mean_russ=squeeze(mean(mean(mean(itc_russ,1),2),3));
mean_rusw=squeeze(mean(mean(mean(itc_rusw,1),2),3));

figure;
plot(F,mean_engs);
hold on;
plot(F,mean_engw);
hold on;
plot(F,mean_russ);
hold on;
plot(F,mean_rusw);




