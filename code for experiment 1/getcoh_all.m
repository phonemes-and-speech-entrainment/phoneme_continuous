function [engs,engw,russ,rusw]=getcoh_all(Data)

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

C_power_engs=eeg_sound_coh(Spectsengs,Soundengs);
C_power_engw=eeg_sound_coh(Spectsengw,Soundengw);
C_power_russ=eeg_sound_coh(Spectsruss,Soundruss);
C_power_rusw=eeg_sound_coh(Spectsrusw,Soundrusw);

engs=nanmean(C_power_engs,3);
engs=reshape(engs,size(C_power_engs,1),size(C_power_engs,2),size(C_power_engs,4));
engw=nanmean(C_power_engw,3);
engw=reshape(engw,size(C_power_engw,1),size(C_power_engw,2),size(C_power_engw,4));
russ=nanmean(C_power_russ,3);
russ=reshape(russ,size(C_power_russ,1),size(C_power_russ,2),size(C_power_russ,4));
rusw=nanmean(C_power_rusw,3);
rusw=reshape(rusw,size(C_power_rusw,1),size(C_power_rusw,2),size(C_power_rusw,4));

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



