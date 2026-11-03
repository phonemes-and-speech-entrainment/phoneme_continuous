%compare power coherence to trial and baseline, at each condition (English strong - 1, English weak - 2, Russian strong -3, Russian weak - 4)
%in the delta, theta and alpha ranges

clearvars;clc;
load('pow_for_baseline_diff_cond.mat');
load('pow_for_baseline_diff_cond2.mat');

%delta
[h1,p1]=ttest(pow_for_stats1(:,1),pow_for_stats_base1(:,1))

[h2,p2]=ttest(pow_for_stats1(:,2),pow_for_stats_base1(:,2))

[h3,p3]=ttest(pow_for_stats1(:,3),pow_for_stats_base1(:,3))

[h4,p4]=ttest(pow_for_stats1(:,4),pow_for_stats_base1(:,4))

%theta
[h5,p5]=ttest(pow_for_stats2(:,1),pow_for_stats_base2(:,1))

[h6,p6]=ttest(pow_for_stats2(:,2),pow_for_stats_base2(:,2))

[h7,p7]=ttest(pow_for_stats2(:,3),pow_for_stats_base2(:,3))

[h8,p8]=ttest(pow_for_stats2(:,4),pow_for_stats_base2(:,4))

%alpha
[h9,p9]=ttest(pow_for_stats3(:,1),pow_for_stats_base3(:,1))

[h10,p10]=ttest(pow_for_stats3(:,2),pow_for_stats_base3(:,2))

[h11,p11]=ttest(pow_for_stats3(:,3),pow_for_stats_base3(:,3))

[h12,p12]=ttest(pow_for_stats3(:,4),pow_for_stats_base3(:,4))
