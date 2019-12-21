%compare itc to stimuli with baseline power; this is averaged over delta (1-4 Hz), theta (4-8 Hz) and alpha (8-12 Hz) ranges


clearvars;
addpath('/Users/gigel/Documents/Speech EEG/Experiment 3 (final)');


load('itc_for_baseline_diff.mat');
load('itc_for_baseline_diff2.mat');

%use T-tests as stats

[~,p1,~,stats1]=ttest(mean_delta,mean_delta2)

[~,p2,~,stats2]=ttest(mean_theta,mean_theta2)

[~,p3,~,stats3]=ttest(mean_alpha,mean_alpha2)

n = length(mean_delta);

bar_delta=[mean(mean_delta),mean(mean_delta2)];

error_delta1=std(mean_delta)./sqrt(n);
error_delta2=std(mean_delta2)./sqrt(n);

error_delta=[error_delta1,error_delta2];

fig=figure('Renderer', 'painters', 'Position', [10 10 1200 300]);

subplot(1,3,1);
%plot trial delta to baseline delta
b1 = bar(bar_delta,'FaceColor','flat');
b1.FaceColor = 'flat';
b1.CData(1,:) = [0.50,0.68,0.74];
b1.CData(2,:) = [0.400,0.400,0.400];
ylim([0 0.05]);
hold on;
mysigstar(gca,[1 2], 0.017, 0.022);
errH1 = errorbar(1,bar_delta(1),error_delta(1),'.','Color','k');
errH2 = errorbar(2,bar_delta(2),error_delta(2),'.','Color','k'); 
errH1.LineWidth = 1.5;
errH2.LineWidth = 1.5;
%er.Color = [0 0 0];                            
%er.LineStyle = 'none'; 
xticks([1 2])
xticklabels({'Experiment','Baseline'})
y2=ylabel('Phase Coherence Difference','FontSize',13,'FontWeight','bold');
%set(y2, 'Units', 'Normalized', 'Position', [-0.07, 0.5, 0]);
title('Delta (1-4 Hz)','FontSize',14,'FontWeight','bold');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontSize',13,'FontWeight','bold');
set(gca,'linewidth',1);
hold off;

bar_theta=[mean(mean_theta),mean(mean_theta2)];

error_theta1=std(mean_theta)./sqrt(n);
error_theta2=std(mean_theta2)./sqrt(n);

error_theta=[error_theta1,error_theta2];

subplot(1,3,2);
%plot trial theta to baseline theta
b2 = bar(bar_theta,'FaceColor','flat');
b2.FaceColor = 'flat';
b2.CData(1,:) = [0.50,0.68,0.74];
b2.CData(2,:) = [0.400,0.400,0.400];
ylim([0 0.05]);
hold on;
hold on;
mysigstar(gca,[1 2], 0.04, 0.0001);
errH1 = errorbar(1,bar_theta(1),error_theta(1),'.','Color','k');
errH2 = errorbar(2,bar_theta(2),error_theta(2),'.','Color','k'); 
errH1.LineWidth = 1.5;
errH2.LineWidth = 1.5;
%er.Color = [0 0 0];                            
%er.LineStyle = 'none'; 
xticks([1 2])
xticklabels({'Experiment','Baseline'})
%y2=ylabel('Phase Coherence Difference','FontSize',13,'FontWeight','bold');
%set(y2, 'Units', 'Normalized', 'Position', [-0.07, 0.5, 0]);
title('Theta (4-8 Hz)','FontSize',14,'FontWeight','bold');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontSize',13,'FontWeight','bold');
set(gca,'linewidth',1);
hold off;

bar_alpha=[mean(mean_alpha),mean(mean_alpha2)];

error_alpha1=std(mean_alpha)./sqrt(n);
error_alpha2=std(mean_alpha2)./sqrt(n);

error_alpha=[error_alpha1,error_alpha2];

subplot(1,3,3);
%plot trial alpha to baseline alpha
b3 = bar(bar_alpha,'FaceColor','flat');
b3.FaceColor = 'flat';
b3.CData(1,:) = [0.50,0.68,0.74];
b3.CData(2,:) = [0.400,0.400,0.400];
ylim([0 0.05]);
hold on;
hold on;
mysigstar(gca,[1 2], 0.015, 0.018);
errH1 = errorbar(1,bar_alpha(1),error_alpha(1),'.','Color','k');
errH2 = errorbar(2,bar_alpha(2),error_alpha(2),'.','Color','k'); 
errH1.LineWidth = 1.5;
errH2.LineWidth = 1.5;
%er.Color = [0 0 0];                            
%er.LineStyle = 'none'; 
xticks([1 2]);
xticklabels({'Experiment','Baseline'});
%y2=ylabel('Phase Coherence Difference','FontSize',13,'FontWeight','bold');
%set(y2, 'Units', 'Normalized', 'Position', [-0.07, 0.5, 0]);
title('Alpha (8-12 Hz)','FontSize',14,'FontWeight','bold');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontSize',13,'FontWeight','bold');
set(gca,'linewidth',1);
hold off;

sgtitle('Phase Coherence Difference: Experimental Trials vs Baseline','FontSize',16);
