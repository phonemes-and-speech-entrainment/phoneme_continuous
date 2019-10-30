clearvars;clc;
load('itc_for_baseline_diff_cond.mat');
load('itc_for_baseline_diff_cond2.mat');


[~,p1,~,stats1]=ttest(itc_for_stats1(:,1),itc_for_stats_base1(:,1))

[~,p2,~,stats2]=ttest(itc_for_stats1(:,2),itc_for_stats_base1(:,2))

[~,p3,~,stats3]=ttest(itc_for_stats1(:,3),itc_for_stats_base1(:,3))

[~,p4,~,stats4]=ttest(itc_for_stats1(:,4),itc_for_stats_base1(:,4))

[~,p5,~,stats5]=ttest(itc_for_stats2(:,1),itc_for_stats_base2(:,1))

[~,p6,~,stats6]=ttest(itc_for_stats2(:,2),itc_for_stats_base2(:,2))

[~,p7,~,stats7]=ttest(itc_for_stats2(:,3),itc_for_stats_base2(:,3))

[~,p8,~,stats8]=ttest(itc_for_stats2(:,4),itc_for_stats_base2(:,4))

[~,p9,~,stats9]=ttest(itc_for_stats3(:,1),itc_for_stats_base3(:,1))

[~,p10,~,stats10]=ttest(itc_for_stats3(:,2),itc_for_stats_base3(:,2))

[~,p11,~,stats11]=ttest(itc_for_stats3(:,3),itc_for_stats_base3(:,3))

[~,p12,~,stats12]=ttest(itc_for_stats3(:,4),itc_for_stats_base3(:,4))