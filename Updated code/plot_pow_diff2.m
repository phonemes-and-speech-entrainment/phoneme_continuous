clearvars;

load('Pow_coh.mat');
load('Pow_coh_rand.mat');

Pow_diff=C_pow_rand-C_power;
Pow_diff=Pow_diff([1:3,5:13,15:21],:,:,:,:);

F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];

a=find(F==1);
b=find(F==4);
c=find(F==8);
d=find(F==12);

mean_pow=squeeze(mean(Pow_diff,4));

pow_for_stats1=mean_pow(:,:,:,a:b);
pow_for_stats1=mean(pow_for_stats1,4);
pow_for_stats2=mean_pow(:,:,:,b:c);
pow_for_stats2=mean(pow_for_stats2,4);
pow_for_stats3=mean_pow(:,:,:,c:d);
pow_for_stats3=mean(pow_for_stats3,4);

pow_for_stats1=permute(pow_for_stats1,[3 1 2]);
pow_for_stats2=permute(pow_for_stats2,[3 1 2]);
pow_for_stats3=permute(pow_for_stats3,[3 1 2]);

pow_for_stats1=mean(pow_for_stats1,3);
pow_for_stats2=mean(pow_for_stats2,3);
pow_for_stats3=mean(pow_for_stats3,3);


pow_for_stats1=reshape(pow_for_stats1,20,4,19);
pow_for_stats2=reshape(pow_for_stats2,20,4,19);
pow_for_stats3=reshape(pow_for_stats3,20,4,19);

pow_for_stats1=squeeze(mean(pow_for_stats1))';
pow_for_stats2=squeeze(mean(pow_for_stats2))';
pow_for_stats3=squeeze(mean(pow_for_stats3))';

mean_delta2=mean(pow_for_stats1,2);
mean_theta2=mean(pow_for_stats2,2);
mean_alpha2=mean(pow_for_stats3,2);

%save('pow_for_baseline_diff2.mat','mean_delta2','mean_theta2','mean_alpha2');

pow_engs=mean_pow(:,:,1:20,:);
pow_engw=mean_pow(:,:,21:40,:);
pow_russ=mean_pow(:,:,41:60,:);
pow_rusw=mean_pow(:,:,61:80,:);

mean_engs=squeeze(mean(mean(mean(pow_engs,3),2)));
mean_engw=squeeze(mean(mean(mean(pow_engw,3),2)));
mean_russ=squeeze(mean(mean(mean(pow_russ,3),2)));
mean_rusw=squeeze(mean(mean(mean(pow_rusw,3),2)));


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
title('EEG Power Coherence Difference per Condition','FontSize',15,'FontWeight','bold');
xlabel('Frequency (Hz)','FontSize',13,'FontWeight','bold');
ylabel('Power coherence difference','FontSize',13,'FontWeight','bold');
ylim([-0.04 0.04]);
set(gca,'linewidth',1);
hold off;

%{
%bar graphs
n=size(Pow_diff,1);

mean_delta_engs=mean(pow_for_stats1(:,1));
mean_delta_engw=mean(pow_for_stats1(:,2));
mean_delta_russ=mean(pow_for_stats1(:,3));
mean_delta_rusw=mean(pow_for_stats1(:,4));

error_delta_engs=std(pow_for_stats1(:,1))/sqrt(n);
error_delta_engw=std(pow_for_stats1(:,2))/sqrt(n);
error_delta_russ=std(pow_for_stats1(:,3))/sqrt(n);
error_delta_rusw=std(pow_for_stats1(:,4))/sqrt(n);

bar_delta=[mean_delta_engs,mean_delta_engw;mean_delta_russ,mean_delta_rusw];
error_delta=[error_delta_engs,error_delta_engw;error_delta_russ,error_delta_rusw];

fig2=figure('Renderer', 'painters', 'Position', [10 10 1200 300]);
subplot(1,3,1);
b1 = bar(bar_delta,'FaceColor','flat');
b1(1).FaceColor='r';
b1(2).FaceColor='b';
ylim([-0.04 0.04]);
hold on;
x=1:2;
%mysigstar(gca,[0.9 1.1], 0.00000172, 0.0121);
%mysigstar(gca,[0.9 1.9], 0.00000182, 0.0001);
errH1 = errorbar(x-0.15,bar_delta(:,1),error_delta(:,1),'.','Color','k');
errH2 = errorbar(x+0.15,bar_delta(:,2),error_delta(:,1),'.','Color','k'); 
errH1.LineWidth = 1.5;
errH2.LineWidth = 1.5;
%er.Color = [0 0 0];                            
%er.LineStyle = 'none'; 
xticks([1 2])
xticklabels({'English','Russian'})
%legend({'Strong','Weak'},'Location','northeast');
y1=ylabel('Power Coherence Difference','FontSize',13,'FontWeight','bold');
%set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.5, 0]);
title('Delta (1-4 Hz)','FontSize',14,'FontWeight','bold');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontSize',13,'FontWeight','bold');
set(gca,'linewidth',1);
hold off;

mean_theta_engs=mean(pow_for_stats2(:,1));
mean_theta_engw=mean(pow_for_stats2(:,2));
mean_theta_russ=mean(pow_for_stats2(:,3));
mean_theta_rusw=mean(pow_for_stats2(:,4));

error_theta_engs=std(pow_for_stats2(:,1))/sqrt(n);
error_theta_engw=std(pow_for_stats2(:,2))/sqrt(n);
error_theta_russ=std(pow_for_stats2(:,3))/sqrt(n);
error_theta_rusw=std(pow_for_stats2(:,4))/sqrt(n);

bar_theta=[mean_theta_engs,mean_theta_engw;mean_theta_russ,mean_theta_rusw];
error_theta=[error_theta_engs,error_theta_engw;error_theta_russ,error_theta_rusw];

subplot(1,3,2);
b2 = bar(bar_theta,'FaceColor','flat');
b2(1).FaceColor='r';
b2(2).FaceColor='b';
ylim([-0.04 0.04]);
hold on;
x=1:2;
%mysigstar(gca,[0.9 1.1], 0.00000172, 0.0121);
%mysigstar(gca,[0.9 1.9], 0.00000182, 0.0001);
errH1 = errorbar(x-0.15,bar_theta(:,1),error_theta(:,1),'.','Color','k');
errH2 = errorbar(x+0.15,bar_theta(:,2),error_theta(:,1),'.','Color','k'); 
errH1.LineWidth = 1.5;
errH2.LineWidth = 1.5;
%er.Color = [0 0 0];                            
%er.LineStyle = 'none'; 
xticks([1 2])
xticklabels({'English','Russian'})
%legend({'Strong','Weak'},'Location','northeast');
%y2=ylabel('Power Coherence Difference','FontSize',13,'FontWeight','bold');
%set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.5, 0]);
title('Theta (4-8 Hz)','FontSize',14,'FontWeight','bold');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontSize',13,'FontWeight','bold');
set(gca,'linewidth',1);
hold off;

mean_alpha_engs=mean(pow_for_stats3(:,1));
mean_alpha_engw=mean(pow_for_stats3(:,2));
mean_alpha_russ=mean(pow_for_stats3(:,3));
mean_alpha_rusw=mean(pow_for_stats3(:,4));

error_alpha_engs=std(pow_for_stats3(:,1))/sqrt(n);
error_alpha_engw=std(pow_for_stats3(:,2))/sqrt(n);
error_alpha_russ=std(pow_for_stats3(:,3))/sqrt(n);
error_alpha_rusw=std(pow_for_stats3(:,4))/sqrt(n);

bar_alpha=[mean_alpha_engs,mean_alpha_engw;mean_alpha_russ,mean_alpha_rusw];
error_alpha=[error_alpha_engs,error_alpha_engw;error_alpha_russ,error_alpha_rusw];

subplot(1,3,3);
b3 = bar(bar_alpha,'FaceColor','flat');
b3(1).FaceColor='r';
b3(2).FaceColor='b';
ylim([-0.04 0.04]);
hold on;
x=1:2;
%mysigstar(gca,[0.9 1.1], 0.00000172, 0.0121);
%mysigstar(gca,[0.9 1.9], 0.00000182, 0.0001);
errH1 = errorbar(x-0.15,bar_alpha(:,1),error_alpha(:,1),'.','Color','k');
errH2 = errorbar(x+0.15,bar_alpha(:,2),error_alpha(:,1),'.','Color','k'); 
errH1.LineWidth = 1.5;
errH2.LineWidth = 1.5;
%er.Color = [0 0 0];                            
%er.LineStyle = 'none'; 
xticks([1 2])
xticklabels({'English','Russian'})
legend({'Strong','Weak'},'Location','northeast');
%y3=ylabel('Power Coherence Difference','FontSize',13,'FontWeight','bold');
%set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.5, 0]);
title('Alpha (8-12 Hz)','FontSize',14,'FontWeight','bold');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontSize',13,'FontWeight','bold');
set(gca,'linewidth',1);
hold off;

sgtitle('Power Coherence Difference in Different Ranges of Oscillations','FontSize',16);
%}
%}
