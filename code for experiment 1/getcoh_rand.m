function [engs,engw,russ,rusw]=getcoh_rand(Data)

files = dir('*.wav');
Y=get_sound_spect(files);

Spects=getspects(Data);

Spectsengs=Spects(:,1:20,:,:,:);
Spectsengw=Spects(:,21:40,:,:,:);
Spectsruss=Spects(:,41:60,:,:,:);
Spectsrusw=Spects(:,61:80,:,:,:);

Soundengs=Y(1:2:39,:,:);
Soundengw=Y(2:2:40,:,:);
Soundruss=Y(41:2:79,:,:);
Soundrusw=Y(42:2:80,:,:);


ordering=randperm(20);

Soundengs_rand=Soundengs(ordering,:,:);
Soundengw_rand=Soundengw(ordering,:,:);
Soundruss_rand=Soundruss(ordering,:,:);
Soundrusw_rand=Soundrusw(ordering,:,:);

C_power_engs_rand=eeg_sound_coh(Spectsengs,Soundengs_rand);
C_power_engw_rand=eeg_sound_coh(Spectsengw,Soundengw_rand);
C_power_russ_rand=eeg_sound_coh(Spectsruss,Soundruss_rand);
C_power_rusw_rand=eeg_sound_coh(Spectsrusw,Soundrusw_rand);


engs=nanmean(C_power_engs_rand,3);
engs=reshape(engs,size(C_power_engs_rand,1),size(C_power_engs_rand,2),size(C_power_engs_rand,4));
engw=nanmean(C_power_engw_rand,3);
engw=reshape(engw,size(C_power_engw_rand,1),size(C_power_engw_rand,2),size(C_power_engw_rand,4));
russ=nanmean(C_power_russ_rand,3);
russ=reshape(russ,size(C_power_russ_rand,1),size(C_power_russ_rand,2),size(C_power_russ_rand,4));
rusw=nanmean(C_power_rusw_rand,3);
rusw=reshape(rusw,size(C_power_rusw_rand,1),size(C_power_rusw_rand,2),size(C_power_rusw_rand,4));

%sengs=std(engs,0,2);
%sengw=std(engw,0,2);
%sruss=std(russ,0,2);
%srusw=std(rusw,0,2);

%for i=1:size(engs,2)
%engs(:,i,:)=engs(:,i,:)./sengs;
%engw(:,i,:)=engw(:,i,:)./sengw;
%russ(:,i,:)=russ(:,i,:)./sruss;
%rusw(:,i,:)=rusw(:,i,:)./srusw;
%end

