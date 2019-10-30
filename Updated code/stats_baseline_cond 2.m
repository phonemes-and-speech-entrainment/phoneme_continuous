clearvars;clc;
load('pow_for_baseline_diff_cond.mat');
load('pow_for_baseline_diff_cond2.mat');


[h1,p1]=ttest(pow_for_stats1(:,1),pow_for_stats_base1(:,1))

[h2,p2]=ttest(pow_for_stats1(:,2),pow_for_stats_base1(:,2))

[h3,p3]=ttest(pow_for_stats1(:,3),pow_for_stats_base1(:,3))

[h4,p4]=ttest(pow_for_stats1(:,4),pow_for_stats_base1(:,4))

[h5,p5]=ttest(pow_for_stats2(:,1),pow_for_stats_base2(:,1))

[h6,p6]=ttest(pow_for_stats2(:,2),pow_for_stats_base2(:,2))

[h7,p7]=ttest(pow_for_stats2(:,3),pow_for_stats_base2(:,3))

[h8,p8]=ttest(pow_for_stats2(:,4),pow_for_stats_base2(:,4))

[h9,p9]=ttest(pow_for_stats3(:,1),pow_for_stats_base3(:,1))

[h10,p10]=ttest(pow_for_stats3(:,2),pow_for_stats_base3(:,2))

[h11,p11]=ttest(pow_for_stats3(:,3),pow_for_stats_base3(:,3))

[h12,p12]=ttest(pow_for_stats3(:,4),pow_for_stats_base3(:,4))