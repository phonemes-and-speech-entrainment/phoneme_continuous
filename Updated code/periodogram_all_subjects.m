subj=size(ALLEEG,2);

Data_all=NaN(subj,32,2000,80,4);
for i=1:subj
    Data_all(i,:,:,:,:)=get_chan_all_subjects(ALLEEG,i);
end


F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];
Fs = 1000;
N  = 2000;
nsc = floor(N/2);
nov = 900;

Power_all=NaN(subj,size(Data_all,2),length(F),size(Data_all,4),size(Data_all,5));

for i=1:subj
    for j=1:size(Data_all,2)
        for k=1:size(Data_all,4)
            for l=1:size(Data_all,5)
                temp1=reshape(Data_all(i,j,:,k,l),1,size(Data_all,3));
                [p,~]=periodogram(temp1,hann(N),F,Fs);
                %temp2=remove_noise(p',F');
                Power_all(i,j,:,k,l)=p;
            end
        end
    end
end


Power_all=nanmean(Power_all,5);
Power_all=reshape(Power_all,size(Power_all,1),size(Power_all,2),size(Power_all,3),size(Power_all,4));

%remove 1/f
%F_power_all=NaN(size(Power_all));
%for i=1:size(Power_all,1)
%    for j=1:size(Power_all,2)
%        for h=1:size(Power_all,4)
%            temp=reshape(Power_all(i,j,:,h),50,1);
%            F_power_all(i,j,:,h)=remove_noise(temp,F');
%        end
%    end
%end
            

Power_engs=Power_all(:,:,:,1:20);
Power_engs=nanmean(Power_engs,4);


Power_engw=Power_all(:,:,:,21:40);
Power_engw=nanmean(Power_engw,4);

Power_russ=Power_all(:,:,:,41:60);
Power_russ=nanmean(Power_russ,4);


Power_rusw=Power_all(:,:,:,61:80);
Power_rusw=nanmean(Power_rusw,4);


Power_engs_midline=Power_engs(:,[5 9 10 14],:);
Power_engs_midline=mean(Power_engs_midline,2);
Power_engs_midline=reshape(Power_engs_midline,subj,length(F));
Power_engs_all=mean(Power_engs_midline);

Power_engw_midline=Power_engw(:,[5 9 10 14],:);
Power_engw_midline=mean(Power_engw_midline,2);
Power_engw_midline=reshape(Power_engw_midline,subj,length(F));
Power_engw_all=mean(Power_engw_midline);

Power_russ_midline=Power_russ(:,[5 9 10 14],:);
Power_russ_midline=mean(Power_russ_midline,2);
Power_russ_midline=reshape(Power_russ_midline,subj,length(F));
Power_russ_all=mean(Power_russ_midline);

Power_rusw_midline=Power_rusw(:,[5 9 10 14],:);
Power_rusw_midline=mean(Power_rusw_midline,2);
Power_rusw_midline=reshape(Power_rusw_midline,subj,length(F));
Power_rusw_all=mean(Power_rusw_midline);

figure;
plot(F,Power_engs_all);
hold on;
plot(F,Power_engw_all);
hold on;
plot(F,Power_russ_all);
hold on;
plot(F,Power_rusw_all);
legend('English Strong', 'English weak','Russian strong','Russian weak');


Pow_engs_theta=Power_engs_midline(:,5:13);
Pow_engs_theta=mean(Pow_engs_theta,2);
Pow_engw_theta=Power_engw_midline(:,5:13);
Pow_engw_theta=mean(Pow_engw_theta,2);
Pow_russ_theta=Power_russ_midline(:,5:13);
Pow_russ_theta=mean(Pow_russ_theta,2);
Pow_rusw_theta=Power_rusw_midline(:,5:13);
Pow_rusw_theta=mean(Pow_rusw_theta,2);
Theta_pow=[Pow_engs_theta,Pow_engw_theta,Pow_russ_theta,Pow_rusw_theta];
Theta=mean(Theta_pow,2);
p1=anova1(Theta_pow);

Pow_engs_alpha=Power_engs_midline(:,16:22);
Pow_engs_alpha=mean(Pow_engs_alpha,2);
Pow_engw_alpha=Power_engw_midline(:,16:22);
Pow_engw_alpha=mean(Pow_engw_alpha,2);
Pow_russ_alpha=Power_russ_midline(:,16:22);
Pow_russ_alpha=mean(Pow_russ_alpha,2);
Pow_rusw_alpha=Power_rusw_midline(:,16:22);
Pow_rusw_alpha=mean(Pow_rusw_alpha,2);
Alpha_pow=[Pow_engs_alpha,Pow_engw_alpha,Pow_russ_alpha,Pow_rusw_alpha];
Alpha=mean(Alpha_pow,2);
p2=anova1(Alpha_pow);

Pow_engs_gamma=Power_engs_midline(:,35:50);
Pow_engs_gamma=mean(Pow_engs_gamma,2);
Pow_engw_gamma=Power_engw_midline(:,35:50);
Pow_engw_gamma=mean(Pow_engw_gamma,2);
Pow_russ_gamma=Power_russ_midline(:,35:50);
Pow_russ_gamma=mean(Pow_russ_gamma,2);
Pow_rusw_gamma=Power_rusw_midline(:,35:50);
Pow_rusw_gamma=mean(Pow_rusw_gamma,2);
Gamma_pow=[Pow_engs_gamma,Pow_engw_gamma,Pow_russ_gamma,Pow_rusw_gamma];
Gamma=mean(Gamma_pow,2);
p3=anova1(Gamma_pow);

All=[Theta,Alpha,Gamma];
p4=anova1(All);


















           