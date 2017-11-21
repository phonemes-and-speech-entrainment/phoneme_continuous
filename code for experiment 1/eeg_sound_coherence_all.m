addpath('O:\Documents\Documents\Documents\Documents\code_for_experiment1');

l=size(ALLEEG,2);

Data_all=NaN(l,32,2000,80,4);
for i=1:l
    Data_all(i,:,:,:,:)=get_chan_all_subjects(ALLEEG,i);
end


F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];


C_phase_engs=NaN(l,size(Data_all,2),size(Data_all,4)/4,length(F));
C_phase_engw=NaN(l,size(Data_all,2),size(Data_all,4)/4,length(F));
C_phase_russ=NaN(l,size(Data_all,2),size(Data_all,4)/4,length(F));
C_phase_rusw=NaN(l,size(Data_all,2),size(Data_all,4)/4,length(F));


for i=1:l
    temp1=reshape(Data_all(i,:,:,:,:),size(Data_all,2),size(Data_all,3),size(Data_all,4),size(Data_all,5));
    [engs,engw,russ,rusw]=getcoh_all(temp1);
    [engs_rand,engw_rand,russ_rand,rusw_rand]=getcoh_rand(temp1);
    C_phase_engs(i,:,:,:)=engs-engs_rand;
    C_phase_engw(i,:,:,:)=engw-engw_rand;
    C_phase_russ(i,:,:,:)=russ-russ_rand;
    C_phase_rusw(i,:,:,:)=rusw-rusw_rand;
end

Phase_engs=nanmean(C_phase_engs,3);
Phase_engw=nanmean(C_phase_engw,3);
Phase_russ=nanmean(C_phase_russ,3);
Phase_rusw=nanmean(C_phase_rusw,3);

Phase_engs_midline=Phase_engs(:,[5 9 10 14],:,:);
Phase_engs_midline=mean(Phase_engs_midline,2);
Phase_engs_midline_all=mean(Phase_engs_midline);
Phase_engs_midline_all=reshape(Phase_engs_midline_all,1,50);

Phase_engw_midline=Phase_engw(:,[5 9 10 14],:,:);
Phase_engw_midline=mean(Phase_engw_midline,2);
Phase_engw_midline_all=mean(Phase_engw_midline);
Phase_engw_midline_all=reshape(Phase_engw_midline_all,1,50);

Phase_russ_midline=Phase_russ(:,[5 9 10 14],:,:);
Phase_russ_midline=mean(Phase_russ_midline,2);
Phase_russ_midline_all=mean(Phase_russ_midline);
Phase_russ_midline_all=reshape(Phase_russ_midline_all,1,50);

Phase_rusw_midline=Phase_rusw(:,[5 9 10 14],:,:);
Phase_rusw_midline=mean(Phase_rusw_midline,2);
Phase_rusw_midline_all=mean(Phase_rusw_midline);
Phase_rusw_midline_all=reshape(Phase_rusw_midline_all,1,50);

figure;
plot(F,Phase_engs_midline_all);
hold on;
plot(F,Phase_engw_midline_all);
hold on;
plot(F,Phase_russ_midline_all);
hold on;
plot(F,Phase_rusw_midline_all);
legend('english strong','english weak','russian strong','russian weak');
title('EEG-sound coherence');


Phase_engs_theta=Phase_engs_midline(:,:,:,5:13);
Phase_engs_theta=mean(Phase_engs_theta,4);
Phase_engs_theta=reshape(Phase_engs_theta,size(Phase_engs_theta,1),1);

Phase_engw_theta=Phase_engw_midline(:,:,:,5:13);
Phase_engw_theta=mean(Phase_engw_theta,4);
Phase_engw_theta=reshape(Phase_engw_theta,size(Phase_engw_theta,1),1);

Phase_russ_theta=Phase_russ_midline(:,:,:,5:13);
Phase_russ_theta=mean(Phase_russ_theta,4);
Phase_russ_theta=reshape(Phase_russ_theta,size(Phase_russ_theta,1),1);

Phase_rusw_theta=Phase_rusw_midline(:,:,:,5:13);
Phase_rusw_theta=mean(Phase_rusw_theta,4);
Phase_rusw_theta=reshape(Phase_rusw_theta,size(Phase_rusw_theta,1),1);

Theta=[Phase_engs_theta,Phase_engw_theta,Phase_russ_theta,Phase_rusw_theta];
p1=anova1(Theta);

Phase_engs_alpha=Phase_engs_midline(:,:,:,16:22);
Phase_engs_alpha=mean(Phase_engs_alpha,4);
Phase_engs_alpha=reshape(Phase_engs_alpha,size(Phase_engs_alpha,1),1);

Phase_engw_alpha=Phase_engw_midline(:,:,:,16:22);
Phase_engw_alpha=mean(Phase_engw_alpha,4);
Phase_engw_alpha=reshape(Phase_engw_alpha,size(Phase_engw_alpha,1),1);

Phase_russ_alpha=Phase_russ_midline(:,:,:,16:22);
Phase_russ_alpha=mean(Phase_russ_alpha,4);
Phase_russ_alpha=reshape(Phase_russ_alpha,size(Phase_russ_alpha,1),1);

Phase_rusw_alpha=Phase_rusw_midline(:,:,:,16:22);
Phase_rusw_alpha=mean(Phase_rusw_alpha,4);
Phase_rusw_alpha=reshape(Phase_rusw_alpha,size(Phase_rusw_alpha,1),1);

Alpha=[Phase_engs_alpha,Phase_engw_alpha,Phase_russ_alpha,Phase_rusw_alpha];
p2=anova1(Alpha);

Phase_engs_gamma=Phase_engs_midline(:,:,:,35:50);
Phase_engs_gamma=mean(Phase_engs_gamma,4);
Phase_engs_gamma=reshape(Phase_engs_gamma,size(Phase_engs_gamma,1),1);

Phase_engw_gamma=Phase_engw_midline(:,:,:,35:50);
Phase_engw_gamma=mean(Phase_engw_gamma,4);
Phase_engw_gamma=reshape(Phase_engw_gamma,size(Phase_engw_gamma,1),1);

Phase_russ_gamma=Phase_russ_midline(:,:,:,35:50);
Phase_russ_gamma=mean(Phase_russ_gamma,4);
Phase_russ_gamma=reshape(Phase_russ_gamma,size(Phase_russ_gamma,1),1);

Phase_rusw_gamma=Phase_rusw_midline(:,:,:,35:50);
Phase_rusw_gamma=mean(Phase_rusw_gamma,4);
Phase_rusw_gamma=reshape(Phase_rusw_gamma,size(Phase_rusw_gamma,1),1);

Gamma=[Phase_engs_gamma,Phase_engw_gamma,Phase_russ_gamma,Phase_rusw_gamma];
p3=anova1(Gamma);


Theta_all=mean(Theta,2);
Alpha_all=mean(Alpha,2);
Gamma_all=mean(Gamma,2);

All=[Theta_all,Alpha_all,Gamma_all];
p4=anova1(All);
















