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

C_phase_all=NaN(l,size(Data_all,2),size(Data_all,4),length(F));
C_phase_all_rand=NaN(l,size(Data_all,2),size(Data_all,4),length(F));

for i=1:l
    temp1=reshape(Spects_all(i,:,:,:,:),size(Spects_all,2),size(Spects_all,3),size(Spects_all,4),size(Spects_all,5),size(Spects_all,6));
    temp2=itc_phase(temp1);
    temp3=itc_phase_rand(temp1);
    C_phase_all(i,:,:,:)=temp2;
    C_phase_all_rand(i,:,:,:)=temp3;
end

C_phase_engs=C_phase_all(:,:,1:20,:);
C_phase_engs=nanmean(C_phase_engs,3);
C_phase_engs_all=mean(C_phase_engs);
Phengs=reshape(C_phase_engs_all,size(C_phase_engs,2),50);


C_phase_engw=C_phase_all(:,:,21:40,:);
C_phase_engw=nanmean(C_phase_engw,3);
C_phase_engw_all=mean(C_phase_engw);
Phengw=reshape(C_phase_engw_all,size(C_phase_engw,2),50);

C_phase_russ=C_phase_all(:,:,41:60,:);
C_phase_russ=nanmean(C_phase_russ,3);
C_phase_russ_all=mean(C_phase_russ);
Phruss=reshape(C_phase_russ_all,size(C_phase_russ,2),50);


C_phase_rusw=C_phase_all(:,:,61:80,:);
C_phase_rusw=nanmean(C_phase_rusw,3);
C_phase_rusw=nanmean(C_phase_rusw,3);
C_phase_rusw_all=mean(C_phase_rusw);
Phrusw=reshape(C_phase_rusw_all,size(C_phase_rusw,2),50);

Engs_Itc=Phengs([5,9,10,14],:);
Engs_Itc=mean(Engs_Itc);
Engw_Itc=Phengw([5,9,10,14],:);
Engw_Itc=mean(Engw_Itc);
Russ_Itc=Phruss([5,9,10,14],:);
Russ_Itc=mean(Russ_Itc);
Rusw_Itc=Phrusw([5,9,10,14],:);
Rusw_Itc=mean(Rusw_Itc);

C_phase_engs_rand=C_phase_all_rand(:,:,1:20,:);
C_phase_engs_rand=nanmean(C_phase_engs_rand,3);
C_phase_engs_all_rand=mean(C_phase_engs_rand);
Phengs_rand=reshape(C_phase_engs_all_rand,size(C_phase_engs_rand,2),50);

C_phase_engw_rand=C_phase_all_rand(:,:,21:40,:);
C_phase_engw_rand=nanmean(C_phase_engw_rand,3);
C_phase_engw_all_rand=mean(C_phase_engw_rand);
Phengw_rand=reshape(C_phase_engw_all_rand,size(C_phase_engw_rand,2),50);

C_phase_russ_rand=C_phase_all_rand(:,:,41:60,:);
C_phase_russ_rand=nanmean(C_phase_russ_rand,3);
C_phase_russ_all_rand=mean(C_phase_russ_rand);
Phruss_rand=reshape(C_phase_russ_all_rand,size(C_phase_russ_rand,2),50);

C_phase_rusw_rand=C_phase_all_rand(:,:,61:80,:);
C_phase_rusw_rand=nanmean(C_phase_rusw_rand,3);
C_phase_rusw_all_rand=mean(C_phase_rusw_rand);
Phrusw_rand=reshape(C_phase_rusw_all_rand,size(C_phase_rusw_rand,2),50);

Engs_Itc_rand=Phengs_rand([5,9,10,14],:);
Engs_Itc_rand=mean(Engs_Itc_rand);
Engw_Itc_rand=Phengw_rand([5,9,10,14],:);
Engw_Itc_rand=mean(Engw_Itc_rand);
Russ_Itc_rand=Phruss_rand([5,9,10,14],:);
Russ_Itc_rand=mean(Russ_Itc_rand);
Rusw_Itc_rand=Phrusw_rand([5,9,10,14],:);
Rusw_Itc_rand=mean(Rusw_Itc_rand);

figure;
plot(F,Engs_Itc);
hold on;
plot(F,Engw_Itc);
hold on;
plot(F,Russ_Itc);
hold on;
plot(F,Rusw_Itc);
legend('English Strong','English Weak','Russian Strong','Russian Weak');

figure;
plot(F,Engs_Itc_rand);
hold on;
plot(F,Engw_Itc_rand);
hold on;
plot(F,Russ_Itc_rand);
hold on;
plot(F,Rusw_Itc_rand);
legend('English Strong','English Weak','Russian Strong','Russian Weak');

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


Phengs_theta_rand=C_phase_engs_rand(:,[5 9 10 14],:,5:13);
Phengw_theta_rand=C_phase_engw_rand(:,[5 9 10 14],:,5:13);
Phruss_theta_rand=C_phase_russ_rand(:,[5 9 10 14],:,5:13);
Phrusw_theta_rand=C_phase_rusw_rand(:,[5 9 10 14],:,5:13);


Phengs_theta_rand=mean(Phengs_theta_rand,2);
Phengs_theta_rand=mean(Phengs_theta_rand,4);

Phengw_theta_rand=mean(Phengw_theta_rand,2);
Phengw_theta_rand=mean(Phengw_theta_rand,4);

Phruss_theta_rand=mean(Phruss_theta_rand,2);
Phruss_theta_rand=mean(Phruss_theta_rand,4);

Phrusw_theta_rand=mean(Phrusw_theta_rand,2);
Phrusw_theta_rand=mean(Phrusw_theta_rand,4);

Theta_Itc_rand=[Phengs_theta_rand,Phengw_theta_rand,Phruss_theta_rand,Phrusw_theta_rand];

p2=anova1(Theta_Itc_rand);

Theta=mean(Theta_Itc,2);
Theta_rand=mean(Theta_Itc_rand,2);



%alpha
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

p3=anova1(Alpha_Itc);


Phengs_alpha_rand=C_phase_engs_rand(:,[5 9 10 14],:,16:22);
Phengw_alpha_rand=C_phase_engw_rand(:,[5 9 10 14],:,16:22);
Phruss_alpha_rand=C_phase_russ_rand(:,[5 9 10 14],:,16:22);
Phrusw_alpha_rand=C_phase_rusw_rand(:,[5 9 10 14],:,16:22);


Phengs_alpha_rand=mean(Phengs_alpha_rand,2);
Phengs_alpha_rand=mean(Phengs_alpha_rand,4);

Phengw_alpha_rand=mean(Phengw_alpha_rand,2);
Phengw_alpha_rand=mean(Phengw_alpha_rand,4);

Phruss_alpha_rand=mean(Phruss_alpha_rand,2);
Phruss_alpha_rand=mean(Phruss_alpha_rand,4);

Phrusw_alpha_rand=mean(Phrusw_alpha_rand,2);
Phrusw_alpha_rand=mean(Phrusw_alpha_rand,4);

Alpha_Itc_rand=[Phengs_alpha_rand,Phengw_alpha_rand,Phruss_alpha_rand,Phrusw_alpha_rand];

p4=anova1(Alpha_Itc_rand);

Alpha=mean(Alpha_Itc,2);
Alpha_rand=mean(Alpha_Itc_rand,2);

%gamma
Phengs_gamma=C_phase_engs(:,[5 9 10 14],:,16:22);
Phengw_gamma=C_phase_engw(:,[5 9 10 14],:,16:22);
Phruss_gamma=C_phase_russ(:,[5 9 10 14],:,16:22);
Phrusw_gamma=C_phase_rusw(:,[5 9 10 14],:,16:22);


Phengs_gamma=mean(Phengs_gamma,2);
Phengs_gamma=mean(Phengs_gamma,4);

Phengw_gamma=mean(Phengw_gamma,2);
Phengw_gamma=mean(Phengw_gamma,4);

Phruss_gamma=mean(Phruss_gamma,2);
Phruss_gamma=mean(Phruss_gamma,4);

Phrusw_gamma=mean(Phrusw_gamma,2);
Phrusw_gamma=mean(Phrusw_gamma,4);

Gamma_Itc=[Phengs_gamma,Phengw_gamma,Phruss_gamma,Phrusw_gamma];

p5=anova1(Gamma_Itc);


Phengs_gamma_rand=C_phase_engs_rand(:,[5 9 10 14],:,16:22);
Phengw_gamma_rand=C_phase_engw_rand(:,[5 9 10 14],:,16:22);
Phruss_gamma_rand=C_phase_russ_rand(:,[5 9 10 14],:,16:22);
Phrusw_gamma_rand=C_phase_rusw_rand(:,[5 9 10 14],:,16:22);


Phengs_gamma_rand=mean(Phengs_gamma_rand,2);
Phengs_gamma_rand=mean(Phengs_gamma_rand,4);

Phengw_gamma_rand=mean(Phengw_gamma_rand,2);
Phengw_gamma_rand=mean(Phengw_gamma_rand,4);

Phruss_gamma_rand=mean(Phruss_gamma_rand,2);
Phruss_gamma_rand=mean(Phruss_gamma_rand,4);

Phrusw_gamma_rand=mean(Phrusw_gamma_rand,2);
Phrusw_gamma_rand=mean(Phrusw_gamma_rand,4);

Gamma_Itc_rand=[Phengs_gamma_rand,Phengw_gamma_rand,Phruss_gamma_rand,Phrusw_gamma_rand];

p6=anova1(Gamma_Itc_rand);

Gamma=mean(Gamma_Itc,2);
Gamma_rand=mean(Gamma_Itc_rand,2);

All=[Theta,Alpha,Gamma];
p7=anova1(All);

All_rand=[Theta_rand,Alpha_rand,Gamma_rand];
p8=anova1(All_rand);







