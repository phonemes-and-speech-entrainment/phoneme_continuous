%addpath('O:\Documents\Documents\Documents\Documents\code for experiment 1');

[Engs_eeg,Engw_eeg,Russ_eeg,Rusw_eeg]=get_chan(EEG);


Itc_engs=get_itc(Engs_eeg);
Itc_engw=get_itc(Engw_eeg);
Itc_russ=get_itc(Russ_eeg);
Itc_rusw=get_itc(Rusw_eeg);

Itc_engs_rand=get_itc_rand(Engs_eeg);
Itc_engw_rand=get_itc_rand(Engw_eeg);
Itc_russ_rand=get_itc_rand(Russ_eeg);
Itc_rusw_rand=get_itc_rand(Rusw_eeg);

Itc_engs_diff=Itc_engs-Itc_engs_rand;
Itc_russ_diff=Itc_russ-Itc_russ_rand;
Itc_engw_diff=Itc_engw-Itc_engw_rand;
Itc_rusw_diff=Itc_rusw-Itc_rusw_rand;

F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];

numel(find(isnan(Itc_engs_diff)))
numel(find(isnan(Itc_russ_diff)))
numel(find(isnan(Itc_rusw_diff)))
numel(find(isnan(Itc_engw_diff)))





