function [C_power_engs,C_power_engw,C_power_russ,C_power_rusw]=getcoh(Data)

files = dir('*.wav');
Y=get_sound_spect(files);

[~,~,page1]=ind2sub(size(Data),find(Data==11));
eng01s=Data(1:end-1,:,page1);
s_eng01s=getspects(eng01s);
sound1=reshape(Y(1,:,:),size(Y,2),size(Y,3));
c_power_eng01s=eeg_sound_coh(s_eng01s,sound1);

[~,~,page2]=ind2sub(size(Data),find(Data==12));
eng02s=Data(1:end-1,:,page2);
s_eng02s=getspects(eng02s);
sound2=reshape(Y(2,:,:),size(Y,2),size(Y,3));
c_power_eng02s=eeg_sound_coh(s_eng02s,sound2);

[~,~,page3]=ind2sub(size(Data),find(Data==13));
eng03s=Data(1:end-1,:,page3);
s_eng03s=getspects(eng03s);
sound3=reshape(Y(3,:,:),size(Y,2),size(Y,3));
c_power_eng03s=eeg_sound_coh(s_eng03s,sound3);

[~,~,page4]=ind2sub(size(Data),find(Data==14));
eng04s=Data(1:end-1,:,page4);
s_eng04s=getspects(eng04s);
sound4=reshape(Y(4,:,:),size(Y,2),size(Y,3));
c_power_eng04s=eeg_sound_coh(s_eng04s,sound4);

[~,~,page5]=ind2sub(size(Data),find(Data==15));
eng05s=Data(1:end-1,:,page5);
s_eng05s=getspects(eng05s);
sound5=reshape(Y(5,:,:),size(Y,2),size(Y,3));
c_power_eng05s=eeg_sound_coh(s_eng05s,sound5);

[~,~,page6]=ind2sub(size(Data),find(Data==16));
eng06s=Data(1:end-1,:,page6);
s_eng06s=getspects(eng06s);
sound6=reshape(Y(6,:,:),size(Y,2),size(Y,3));
c_power_eng06s=eeg_sound_coh(s_eng06s,sound6);

[~,~,page7]=ind2sub(size(Data),find(Data==17));
eng07s=Data(1:end-1,:,page7);
s_eng07s=getspects(eng07s);
sound7=reshape(Y(7,:,:),size(Y,2),size(Y,3));
c_power_eng07s=eeg_sound_coh(s_eng07s,sound7);


[~,~,page8]=ind2sub(size(Data),find(Data==18));
eng08s=Data(1:end-1,:,page8);
s_eng08s=getspects(eng08s);
sound8=reshape(Y(8,:,:),size(Y,2),size(Y,3));
c_power_eng08s=eeg_sound_coh(s_eng08s,sound8);


[~,~,page9]=ind2sub(size(Data),find(Data==19));
eng09s=Data(1:end-1,:,page9);
s_eng09s=getspects(eng09s);
sound9=reshape(Y(1,:,:),size(Y,2),size(Y,3));
c_power_eng09s=eeg_sound_coh(s_eng09s,sound9);


[~,~,page10]=ind2sub(size(Data),find(Data==20));
eng10s=Data(1:end-1,:,page10);
s_eng10s=getspects(eng10s);
sound10=reshape(Y(10,:,:),size(Y,2),size(Y,3));
c_power_eng10s=eeg_sound_coh(s_eng10s,sound10);


[~,~,page11]=ind2sub(size(Data),find(Data==21));
eng11s=Data(1:end-1,:,page11);
s_eng11s=getspects(eng11s);
sound11=reshape(Y(11,:,:),size(Y,2),size(Y,3));
c_power_eng11s=eeg_sound_coh(s_eng11s,sound11);


[~,~,page12]=ind2sub(size(Data),find(Data==22));
eng12s=Data(1:end-1,:,page12);
s_eng12s=getspects(eng12s);
sound12=reshape(Y(12,:,:),size(Y,2),size(Y,3));
c_power_eng12s=eeg_sound_coh(s_eng12s,sound12);


[~,~,page13]=ind2sub(size(Data),find(Data==23));
eng13s=Data(1:end-1,:,page13);
s_eng13s=getspects(eng13s);
sound13=reshape(Y(13,:,:),size(Y,2),size(Y,3));
c_power_eng13s=eeg_sound_coh(s_eng13s,sound13);


[~,~,page14]=ind2sub(size(Data),find(Data==24));
eng14s=Data(1:end-1,:,page14);
s_eng14s=getspects(eng14s);
sound14=reshape(Y(14,:,:),size(Y,2),size(Y,3));
c_power_eng14s=eeg_sound_coh(s_eng14s,sound14);

[~,~,page15]=ind2sub(size(Data),find(Data==25));
eng15s=Data(1:end-1,:,page15);
s_eng15s=getspects(eng15s);
sound15=reshape(Y(15,:,:),size(Y,2),size(Y,3));
c_power_eng15s=eeg_sound_coh(s_eng15s,sound15);

[~,~,page16]=ind2sub(size(Data),find(Data==26));
eng16s=Data(1:end-1,:,page16);
s_eng16s=getspects(eng16s);
sound16=reshape(Y(16,:,:),size(Y,2),size(Y,3));
c_power_eng16s=eeg_sound_coh(s_eng16s,sound16);

[~,~,page17]=ind2sub(size(Data),find(Data==27));
eng17s=Data(1:end-1,:,page17);
s_eng17s=getspects(eng17s);
sound17=reshape(Y(17,:,:),size(Y,2),size(Y,3));
c_power_eng17s=eeg_sound_coh(s_eng17s,sound17);

[~,~,page18]=ind2sub(size(Data),find(Data==28));
eng18s=Data(1:end-1,:,page18);
s_eng18s=getspects(eng18s);
sound18=reshape(Y(18,:,:),size(Y,2),size(Y,3));
c_power_eng18s=eeg_sound_coh(s_eng18s,sound18);

[~,~,page19]=ind2sub(size(Data),find(Data==29));
eng19s=Data(1:end-1,:,page19);
s_eng19s=getspects(eng19s);
sound19=reshape(Y(19,:,:),size(Y,2),size(Y,3));
c_power_eng19s=eeg_sound_coh(s_eng19s,sound19);

[~,~,page20]=ind2sub(size(Data),find(Data==30));
eng20s=Data(1:end-1,:,page20);
s_eng20s=getspects(eng20s);
sound20=reshape(Y(20,:,:),size(Y,2),size(Y,3));
c_power_eng20s=eeg_sound_coh(s_eng20s,sound20);

C_power_engs = cat(3,c_power_eng01s,c_power_eng02s,c_power_eng03s,c_power_eng04s,...
c_power_eng05s,c_power_eng06s,c_power_eng07s,c_power_eng08s,c_power_eng09s,c_power_eng10s,...
c_power_eng11s,c_power_eng12s,c_power_eng13s,c_power_eng14s,c_power_eng15s,c_power_eng16s,...
c_power_eng17s,c_power_eng18s,c_power_eng19s,c_power_eng20s);


[~,~,page21]=ind2sub(size(Data),find(Data==31));
eng01w=Data(1:end-1,:,page21);
s_eng01w=getspects(eng01w);
sound21=reshape(Y(21,:,:),size(Y,2),size(Y,3));
c_power_eng01w=eeg_sound_coh(s_eng01w,sound21);

[~,~,page22]=ind2sub(size(Data),find(Data==32));
eng02w=Data(1:end-1,:,page22);
s_eng02w=getspects(eng02w)
sound22=reshape(Y(22,:,:),size(Y,2),size(Y,3));
c_power_eng02w=eeg_sound_coh(s_eng02w,sound22);

[~,~,page23]=ind2sub(size(Data),find(Data==33));
eng03w=Data(1:end-1,:,page23);
s_eng03w=getspects(eng03w);
sound23=reshape(Y(23,:,:),size(Y,2),size(Y,3));
c_power_eng03w=eeg_sound_coh(s_eng03w,sound23);

[~,~,page24]=ind2sub(size(Data),find(Data==34));
eng04w=Data(1:end-1,:,page24);
s_eng04w=getspects(eng04w);
sound24=reshape(Y(24,:,:),size(Y,2),size(Y,3));
c_power_eng04w=eeg_sound_coh(s_eng04w,sound24);

[~,~,page25]=ind2sub(size(Data),find(Data==35));
eng05w=Data(1:end-1,:,page25);
s_eng05w=getspects(eng05w);
sound25=reshape(Y(25,:,:),size(Y,2),size(Y,3));
c_power_eng05w=eeg_sound_coh(s_eng05w,sound25);

[~,~,page26]=ind2sub(size(Data),find(Data==36));
eng06w=Data(1:end-1,:,page26);
s_eng06w=getspects(eng06w);
sound26=reshape(Y(26,:,:),size(Y,2),size(Y,3));
c_power_eng06w=eeg_sound_coh(s_eng06w,sound26);

[~,~,page27]=ind2sub(size(Data),find(Data==37));
eng07w=Data(1:end-1,:,page27);
s_eng07w=getspects(eng07w);
sound27=reshape(Y(27,:,:),size(Y,2),size(Y,3));
c_power_eng07w=eeg_sound_coh(s_eng07w,sound27);

[~,~,page28]=ind2sub(size(Data),find(Data==38));
eng08w=Data(1:end-1,:,page28);
s_eng08w=getspects(eng08w);
sound28=reshape(Y(28,:,:),size(Y,2),size(Y,3));
c_power_eng08w=eeg_sound_coh(s_eng08w,sound28);

[~,~,page29]=ind2sub(size(Data),find(Data==39));
eng09w=Data(1:end-1,:,page29);
s_eng09w=getspects(eng09w);
sound29=reshape(Y(29,:,:),size(Y,2),size(Y,3));
c_power_eng09w=eeg_sound_coh(s_eng09w,sound29);

[~,~,page30]=ind2sub(size(Data),find(Data==40));
eng10w=Data(1:end-1,:,page30);
s_eng10w=getspects(eng10w);
sound30=reshape(Y(30,:,:),size(Y,2),size(Y,3));
c_power_eng10w=eeg_sound_coh(s_eng10w,sound30);

[~,~,page31]=ind2sub(size(Data),find(Data==41));
eng11w=Data(1:end-1,:,page31);
s_eng11w=getspects(eng11w);
sound31=reshape(Y(31,:,:),size(Y,2),size(Y,3));
c_power_eng11w=eeg_sound_coh(s_eng11w,sound31);

[~,~,page32]=ind2sub(size(Data),find(Data==42));
eng12w=Data(1:end-1,:,page32);
s_eng12w=getspects(eng12w);
sound32=reshape(Y(32,:,:),size(Y,2),size(Y,3));
c_power_eng12w=eeg_sound_coh(s_eng12w,sound32);

[~,~,page33]=ind2sub(size(Data),find(Data==43));
eng13w=Data(1:end-1,:,page33);
s_eng13w=getspects(eng13w);
sound33=reshape(Y(31,:,:),size(Y,2),size(Y,3));
c_power_eng13w=eeg_sound_coh(s_eng13w,sound33);

[~,~,page34]=ind2sub(size(Data),find(Data==44));
eng14w=Data(1:end-1,:,page34);
s_eng14w=getspects(eng14w);
sound34=reshape(Y(34,:,:),size(Y,2),size(Y,3));
c_power_eng14w=eeg_sound_coh(s_eng14w,sound34);

[~,~,page35]=ind2sub(size(Data),find(Data==45));
eng15w=Data(1:end-1,:,page35);
s_eng15w=getspects(eng15w);
sound35=reshape(Y(35,:,:),size(Y,2),size(Y,3));
c_power_eng15w=eeg_sound_coh(s_eng15w,sound35);

[~,~,page36]=ind2sub(size(Data),find(Data==46));
eng16w=Data(1:end-1,:,page36);
s_eng16w=getspects(eng16w);
sound36=reshape(Y(36,:,:),size(Y,2),size(Y,3));
c_power_eng16w=eeg_sound_coh(s_eng16w,sound36);

[~,~,page37]=ind2sub(size(Data),find(Data==47));
eng17w=Data(1:end-1,:,page37);
s_eng17w=getspects(eng17w);
sound37=reshape(Y(37,:,:),size(Y,2),size(Y,3));
c_power_eng17w=eeg_sound_coh(s_eng17w,sound37);

[~,~,page38]=ind2sub(size(Data),find(Data==48));
eng18w=Data(1:end-1,:,page38);
s_eng18w=getspects(eng18w);
sound38=reshape(Y(38,:,:),size(Y,2),size(Y,3));
c_power_eng18w=eeg_sound_coh(s_eng18w,sound38);

[~,~,page39]=ind2sub(size(Data),find(Data==49));
eng19w=Data(1:end-1,:,page39);
s_eng19w=getspects(eng19w);
sound39=reshape(Y(39,:,:),size(Y,2),size(Y,3));
c_power_eng19w=eeg_sound_coh(s_eng19w,sound39);

[~,~,page40]=ind2sub(size(Data),find(Data==50));
eng20w=Data(1:end-1,:,page40);
s_eng20w=getspects(eng20w);
sound40=reshape(Y(40,:,:),size(Y,2),size(Y,3));
c_power_eng20w=eeg_sound_coh(s_eng20w,sound40);

C_power_engw = cat(3,c_power_eng01w,c_power_eng02w,c_power_eng03w,c_power_eng04w,...
                   c_power_eng05w,c_power_eng06w,c_power_eng07w,c_power_eng08w,c_power_eng09w,...
                   c_power_eng10w,c_power_eng11w,c_power_eng12w,c_power_eng13w,c_power_eng14w,...
                   c_power_eng15w,c_power_eng16w,c_power_eng17w,c_power_eng18w,c_power_eng19w,c_power_eng20w);



[~,~,page41]=ind2sub(size(Data),find(Data==101));
rus01s=Data(1:end-1,:,page41);
s_rus01s=getspects(rus01s);
sound41=reshape(Y(41,:,:),size(Y,2),size(Y,3));
c_power_rus01s=eeg_sound_coh(s_rus01s,sound41);

[~,~,page42]=ind2sub(size(Data),find(Data==102));
rus02s=Data(1:end-1,:,page42);
s_rus02s=getspects(rus02s);
sound42=reshape(Y(42,:,:),size(Y,2),size(Y,3));
c_power_rus02s=eeg_sound_coh(s_rus02s,sound42);

[~,~,page43]=ind2sub(size(Data),find(Data==103));
rus03s=Data(1:end-1,:,page43);
s_rus03s=getspects(rus03s);
sound43=reshape(Y(43,:,:),size(Y,2),size(Y,3));
c_power_rus03s=eeg_sound_coh(s_rus03s,sound43);

[~,~,page44]=ind2sub(size(Data),find(Data==104));
rus04s=Data(1:end-1,:,page44);
s_rus04s=getspects(rus04s);
sound44=reshape(Y(43,:,:),size(Y,2),size(Y,3));
c_power_rus04s=eeg_sound_coh(s_rus04s,sound44);

[~,~,page45]=ind2sub(size(Data),find(Data==105));
rus05s=Data(1:end-1,:,page45);
s_rus05s=getspects(rus05s);
sound45=reshape(Y(45,:,:),size(Y,2),size(Y,3));
c_power_rus05s=eeg_sound_coh(s_rus05s,sound45);

[~,~,page46]=ind2sub(size(Data),find(Data==106));
rus06s=Data(1:end-1,:,page46);
s_rus06s=getspects(rus06s);
sound46=reshape(Y(46,:,:),size(Y,2),size(Y,3));
c_power_rus06s=eeg_sound_coh(s_rus06s,sound46);

[~,~,page47]=ind2sub(size(Data),find(Data==107));
rus07s=Data(1:end-1,:,page47);
s_rus07s=getspects(rus07s);
sound47=reshape(Y(47,:,:),size(Y,2),size(Y,3));
c_power_rus07s=eeg_sound_coh(s_rus07s,sound47);

[~,~,page48]=ind2sub(size(Data),find(Data==108));
rus08s=Data(1:end-1,:,page48);
s_rus08s=getspects(rus08s);
sound48=reshape(Y(48,:,:),size(Y,2),size(Y,3));
c_power_rus08s=eeg_sound_coh(s_rus08s,sound48);

[~,~,page49]=ind2sub(size(Data),find(Data==109));
rus09s=Data(1:end-1,:,page49);
s_rus09s=getspects(rus09s);
sound49=reshape(Y(49,:,:),size(Y,2),size(Y,3));
c_power_rus09s=eeg_sound_coh(s_rus09s,sound49);

[~,~,page50]=ind2sub(size(Data),find(Data==110));
rus10s=Data(1:end-1,:,page50);
s_rus10s=getspects(rus10s);
sound50=reshape(Y(50,:,:),size(Y,2),size(Y,3));
c_power_rus10s=eeg_sound_coh(s_rus10s,sound50);

[~,~,page51]=ind2sub(size(Data),find(Data==111));
rus11s=Data(1:end-1,:,page51);
s_rus11s=getspects(rus11s);
sound51=reshape(Y(51,:,:),size(Y,2),size(Y,3));
c_power_rus11s=eeg_sound_coh(s_rus11s,sound51);

[~,~,page52]=ind2sub(size(Data),find(Data==112));
rus12s=Data(1:end-1,:,page52);
s_rus12s=getspects(rus12s);
sound52=reshape(Y(52,:,:),size(Y,2),size(Y,3));
c_power_rus12s=eeg_sound_coh(s_rus12s,sound52);

[~,~,page53]=ind2sub(size(Data),find(Data==113));
rus13s=Data(1:end-1,:,page53);
s_rus13s=getspects(rus13s);
sound53=reshape(Y(53,:,:),size(Y,2),size(Y,3));
c_power_rus13s=eeg_sound_coh(s_rus13s,sound53);

[~,~,page54]=ind2sub(size(Data),find(Data==114));
rus14s=Data(1:end-1,:,page54);
s_rus14s=getspects(rus14s);
sound54=reshape(Y(54,:,:),size(Y,2),size(Y,3));
c_power_rus14s=eeg_sound_coh(s_rus14s,sound54);

[~,~,page55]=ind2sub(size(Data),find(Data==115));
rus15s=Data(1:end-1,:,page55);
s_rus15s=getspects(rus15s);
sound55=reshape(Y(55,:,:),size(Y,2),size(Y,3));
c_power_rus15s=eeg_sound_coh(s_rus15s,sound55);

[~,~,page56]=ind2sub(size(Data),find(Data==116));
rus16s=Data(1:end-1,:,page56);
s_rus16s=getspects(rus16s);
sound56=reshape(Y(56,:,:),size(Y,2),size(Y,3));
c_power_rus16s=eeg_sound_coh(s_rus16s,sound56);

[~,~,page57]=ind2sub(size(Data),find(Data==117));
rus17s=Data(1:end-1,:,page57);
s_rus17s=getspects(rus17s);
sound57=reshape(Y(57,:,:),size(Y,2),size(Y,3));
c_power_rus17s=eeg_sound_coh(s_rus17s,sound57);

[~,~,page58]=ind2sub(size(Data),find(Data==118));
rus18s=Data(1:end-1,:,page58);
s_rus18s=getspects(rus18s);
sound58=reshape(Y(58,:,:),size(Y,2),size(Y,3));
c_power_rus18s=eeg_sound_coh(s_rus18s,sound58);

[~,~,page59]=ind2sub(size(Data),find(Data==119));
rus19s=Data(1:end-1,:,page59);
s_rus19s=getspects(rus19s);
sound59=reshape(Y(59,:,:),size(Y,2),size(Y,3));
c_power_rus19s=eeg_sound_coh(s_rus19s,sound59);

[~,~,page60]=ind2sub(size(Data),find(Data==120));
rus20s=Data(1:end-1,:,page60);
s_rus20s=getspects(rus20s);
sound60=reshape(Y(60,:,:),size(Y,2),size(Y,3));
c_power_rus20s=eeg_sound_coh(s_rus20s,sound60);

C_power_russ = cat(3,c_power_rus01s,c_power_rus02s,c_power_rus03s,c_power_rus04s,...
                   c_power_rus05s,c_power_rus06s,c_power_rus07s,c_power_rus08s,c_power_rus09s,...
                   c_power_rus10s,c_power_rus11s,c_power_rus12s,c_power_rus13s,c_power_rus14s,...
                   c_power_rus15s,c_power_rus16s,c_power_rus17s,c_power_rus18s,c_power_rus19s,c_power_rus20s);


[~,~,page61]=ind2sub(size(Data),find(Data==121));
rus01w=Data(1:end-1,:,page61);
s_rus01w=getspects(rus01w);
sound61=reshape(Y(61,:,:),size(Y,2),size(Y,3));
c_power_rus01w=eeg_sound_coh(s_rus01w,sound61);

[~,~,page62]=ind2sub(size(Data),find(Data==122));
rus02w=Data(1:end-1,:,page62);
s_rus02w=getspects(rus02w);
sound62=reshape(Y(62,:,:),size(Y,2),size(Y,3));
c_power_rus02w=eeg_sound_coh(s_rus02w,sound62);

[~,~,page63]=ind2sub(size(Data),find(Data==123));
rus03w=Data(1:end-1,:,page63);
s_rus03w=getspects(rus03w);
sound63=reshape(Y(63,:,:),size(Y,2),size(Y,3));
c_power_rus03w=eeg_sound_coh(s_rus03w,sound63);

[~,~,page64]=ind2sub(size(Data),find(Data==124));
rus04w=Data(1:end-1,:,page64);
s_rus04w=getspects(rus04w);
sound64=reshape(Y(64,:,:),size(Y,2),size(Y,3));
c_power_rus04w=eeg_sound_coh(s_rus04w,sound64);

[~,~,page65]=ind2sub(size(Data),find(Data==125));
rus05w=Data(1:end-1,:,page65);
s_rus05w=getspects(rus05w);
sound65=reshape(Y(65,:,:),size(Y,2),size(Y,3));
c_power_rus05w=eeg_sound_coh(s_rus05w,sound65);

[~,~,page66]=ind2sub(size(Data),find(Data==126));
rus06w=Data(1:end-1,:,page66);
s_rus06w=getspects(rus06w);
sound66=reshape(Y(66,:,:),size(Y,2),size(Y,3));
c_power_rus06w=eeg_sound_coh(s_rus06w,sound66);

[~,~,page67]=ind2sub(size(Data),find(Data==127));
rus07w=Data(1:end-1,:,page67);
s_rus07w=getspects(rus07w);
sound67=reshape(Y(67,:,:),size(Y,2),size(Y,3));
c_power_rus07w=eeg_sound_coh(s_rus07w,sound67);

[~,~,page68]=ind2sub(size(Data),find(Data==128));
rus08w=Data(1:end-1,:,page68);
s_rus08w=getspects(rus08w);
sound68=reshape(Y(68,:,:),size(Y,2),size(Y,3));
c_power_rus08w=eeg_sound_coh(s_rus08w,sound68);

[~,~,page69]=ind2sub(size(Data),find(Data==129));
rus09w=Data(1:end-1,:,page69);
s_rus09w=getspects(rus09w);
sound69=reshape(Y(69,:,:),size(Y,2),size(Y,3));
c_power_rus09w=eeg_sound_coh(s_rus09w,sound69);

[~,~,page70]=ind2sub(size(Data),find(Data==130));
rus10w=Data(1:end-1,:,page70);
s_rus10w=getspects(rus10w);
sound70=reshape(Y(70,:,:),size(Y,2),size(Y,3));
c_power_rus10w=eeg_sound_coh(s_rus10w,sound70);

[~,~,page71]=ind2sub(size(Data),find(Data==131));
rus11w=Data(1:end-1,:,page71);
s_rus11w=getspects(rus11w);
sound71=reshape(Y(71,:,:),size(Y,2),size(Y,3));
c_power_rus11w=eeg_sound_coh(s_rus11w,sound71);

[~,~,page72]=ind2sub(size(Data),find(Data==132));
rus12w=Data(1:end-1,:,page72);
s_rus12w=getspects(rus12w);
sound72=reshape(Y(72,:,:),size(Y,2),size(Y,3));
c_power_rus12w=eeg_sound_coh(s_rus12w,sound72);

[~,~,page73]=ind2sub(size(Data),find(Data==133));
rus13w=Data(1:end-1,:,page73);
s_rus13w=getspects(rus13w);
sound73=reshape(Y(73,:,:),size(Y,2),size(Y,3));
c_power_rus13w=eeg_sound_coh(s_rus13w,sound73);

[~,~,page74]=ind2sub(size(Data),find(Data==134));
rus14w=Data(1:end-1,:,page74);
s_rus14w=getspects(rus14w);
sound74=reshape(Y(74,:,:),size(Y,2),size(Y,3));
c_power_rus14w=eeg_sound_coh(s_rus14w,sound74);

[~,~,page75]=ind2sub(size(Data),find(Data==135));
rus15w=Data(1:end-1,:,page75);
s_rus15w=getspects(rus15w);
sound75=reshape(Y(75,:,:),size(Y,2),size(Y,3));
c_power_rus15w=eeg_sound_coh(s_rus15w,sound75);

[~,~,page76]=ind2sub(size(Data),find(Data==136));
rus16w=Data(1:end-1,:,page76);
s_rus16w=getspects(rus16w);
sound76=reshape(Y(76,:,:),size(Y,2),size(Y,3));
c_power_rus16w=eeg_sound_coh(s_rus16w,sound76);

[~,~,page77]=ind2sub(size(Data),find(Data==137));
rus17w=Data(1:end-1,:,page77);
s_rus17w=getspects(rus17w);
sound77=reshape(Y(77,:,:),size(Y,2),size(Y,3));
c_power_rus17w=eeg_sound_coh(s_rus17w,sound77);

[~,~,page78]=ind2sub(size(Data),find(Data==138));
rus18w=Data(1:end-1,:,page78);
s_rus18w=getspects(rus18w);
sound78=reshape(Y(78,:,:),size(Y,2),size(Y,3));
c_power_rus18w=eeg_sound_coh(s_rus18w,sound78);

[~,~,page79]=ind2sub(size(Data),find(Data==139));
rus19w=Data(1:end-1,:,page79);
s_rus19w=getspects(rus19w);
sound79=reshape(Y(79,:,:),size(Y,2),size(Y,3));
c_power_rus19w=eeg_sound_coh(s_rus19w,sound79);

[~,~,page80]=ind2sub(size(Data),find(Data==140));
rus20w=Data(1:end-1,:,page80);
s_rus20w=getspects(rus20w);
sound80=reshape(Y(80,:,:),size(Y,2),size(Y,3));
c_power_rus20w=eeg_sound_coh(s_rus20w,sound80);

C_power_rusw = cat(3,c_power_rus01w,c_power_rus02w,c_power_rus03w,c_power_rus04w,...
                   c_power_rus05w,c_power_rus06w,c_power_rus07w,c_power_rus08w,c_power_rus09w,...
                   c_power_rus10w,c_power_rus11w,c_power_rus12w,c_power_rus13w,c_power_rus14w,...
                   c_power_rus15w,c_power_rus16w,c_power_rus17w,c_power_rus18w,c_power_rus19w,c_power_rus20w);








