clearvars;

load('EEG_sound_coherence.mat');
load('EEG_sound_coherence_rand.mat');

F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];

ITC_diff=C_phase_sound-Random_c_phase;
ITC_diff=ITC_diff([1:3,5:13,15:21],:,:,:,:);

mean_itc=squeeze(mean(ITC_diff,4));

itc_engs=mean_itc(:,:,1:20,:);
itc_engw=mean_itc(:,:,21:40,:);
itc_russ=mean_itc(:,:,41:60,:);
itc_rusw=mean_itc(:,:,61:80,:);

mean_engs=squeeze(mean(mean(mean(itc_engs,1),2),3));
mean_engw=squeeze(mean(mean(mean(itc_engw,1),2),3));
mean_russ=squeeze(mean(mean(mean(itc_russ,1),2),3));
mean_rusw=squeeze(mean(mean(mean(itc_rusw,1),2),3));

fig1=figure('Renderer', 'painters', 'Position', [10 10 600 400]);
plot(F,mean_engs,'-o','Color',[0.93 0.19 0.19]);
hold on;
plot(F,mean_engw,'-o','Color',[0.33 0 0.93]);
hold on;
plot(F,mean_russ,'-o','Color',[1 0.5 0]);
hold on;
plot(F,mean_rusw,'-o','Color',[0.13 0.67 0.9]);
xticks(2:2:40);
legend('english strong','english weak','russian strong','russian weak');
title('Cerebro-acoustic Coherence Difference per Condition','FontSize',15,'FontWeight','bold');
xlabel('Frequency (Hz)','FontSize',13,'FontWeight','bold');
ylabel('Phase coherence difference','FontSize',13,'FontWeight','bold');
ylim([-0.08 0.08]);
set(gca,'linewidth',1);
hold off;



