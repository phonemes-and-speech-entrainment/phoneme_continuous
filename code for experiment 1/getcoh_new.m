function [es,ew,rs,rw]=getcoh_new(Data)

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

ordering=randperm(20);

Soundengs_rand=Soundengs(ordering,:,:);
Soundengw_rand=Soundengw(ordering,:,:);
Soundruss_rand=Soundruss(ordering,:,:);
Soundrusw_rand=Soundrusw(ordering,:,:);

C_power_engs_rand=eeg_sound_coh(Spectsengs,Soundengs_rand);
C_power_engw_rand=eeg_sound_coh(Spectsengw,Soundengw_rand);
C_power_russ_rand=eeg_sound_coh(Spectsruss,Soundruss_rand);
C_power_rusw_rand=eeg_sound_coh(Spectsrusw,Soundrusw_rand);


engs=C_power_engs-C_power_engs_rand;
engw=C_power_engw-C_power_engs_rand;
russ=C_power_russ-C_power_russ_rand;
rusw=C_power_rusw-C_power_rusw_rand;

engs=nanmean(engs,3);
engs=reshape(engs,size(C_power_engs_rand,1),size(C_power_engs_rand,2),size(C_power_engs_rand,4));
engw=nanmean(engw,3);
engw=reshape(engw,size(C_power_engw_rand,1),size(C_power_engw_rand,2),size(C_power_engw_rand,4));
russ=nanmean(russ,3);
russ=reshape(russ,size(C_power_russ_rand,1),size(C_power_russ_rand,2),size(C_power_russ_rand,4));
rusw=nanmean(rusw,3);
rusw=reshape(rusw,size(C_power_rusw_rand,1),size(C_power_rusw_rand,2),size(C_power_rusw_rand,4));

es=NaN(size(engs,1),size(engs,2),size(engs,3));
ew=NaN(size(engs,1),size(engs,2),size(engs,3));
rs=NaN(size(engs,1),size(engs,2),size(engs,3));
rw=NaN(size(engs,1),size(engs,2),size(engs,3));

sengs=std(engs,0,2);
sengw=std(engw,0,2);
sruss=std(russ,0,3);
srusw=std(rusw,0,3);

for i=1:size(engs,3)
es(:,:,i)=engs(:,:,i)./sengs;
ew(:,:,i)=engw(:,:,i)./sengw;
rs(:,:,i)=russ(:,:,i)./sruss;
rw(:,:,i)=rusw(:,:,i)./srusw;
end






 

