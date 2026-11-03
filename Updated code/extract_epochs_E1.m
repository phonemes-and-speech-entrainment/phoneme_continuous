clearvars;
addpath('/Users/gigel/Documents/MATLAB/eeglab13_6_5b');
%here cd to folder where .mul files are, if on computer
files=dir('*.set');
h=waitbar(0,'Please wait...');

for i=6:length(files)
waitbar(i/length(files))

[token,remain]=strtok(files(i).name,'.');

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename',files(i).name,'filepath','/Users/gigel/Documents/Speech EEG/Experiment 1/EEG files/');
EEG.setname=token;
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET]=eeg_store(ALLEEG, EEG,1);
EEG = eeg_checkset( EEG );
EEG=pop_chanedit(EEG, 'lookup','/Users/gigel/Documents/MATLAB/eeglab13_6_5b/plugins/dipfit2.3/standard_BESA/standard-10-5-cap385.elp');
EEG = eeg_checkset( EEG );
EEG = pop_eegfiltnew(EEG, [], 50, 264, 0, [], 1);
EEG = eeg_checkset( EEG );
EEG = pop_reref( EEG, []);
EEG = eeg_checkset( EEG );
if (10<=i) && (i<=19)
    EEG = pop_epoch( EEG, {  'S 11'  'S 12'  'S 13'  'S 14'  'S 15'  'S 16' 'S 17' 'S 18' 'S 19' 'S 20' 'S 21'  'S 22'  'S 23'  'S 24'  'S 25'  'S 26' 'S 27' 'S 28' 'S 29' 'S 30' 'S 31'  'S 32' 'S 33' 'S 34' 'S 35' 'S 36' 'S 37' 'S 38' 'S 39' 'S 40' 'S 41' 'S 42' 'S 43' 'S 44' 'S 45' 'S 46' 'S 47' 'S 48' 'S 49' 'S 50' 'S101' 'S102' 'S103' 'S104' 'S105' 'S106' 'S107' 'S108' 'S109' 'S110' 'S111' 'S112' 'S113' 'S114' 'S115' 'S116' 'S117' 'S118' 'S119' 'S120' 'S121' 'S122' 'S123' 'S124' 'S125' 'S126' 'S127' 'S128' 'S129' 'S130' 'S131' 'S132' 'S133' 'S134' 'S135' 'S136' 'S137' 'S138' 'S139' 'S140'}, [0  2], 'newname', strcat(token,' EEG epochs'), 'epochinfo', 'yes');
    EEG = eeg_checkset( EEG );
    [ALLEEG EEG CURRENTSET]=eeg_store(ALLEEG, EEG);
else
    EEG = pop_epoch( EEG, {  '011'  '012'  '013'  '014'  '015'  '016' '017' '018' '019' '020' '021'  '022'  '023'  '024'  '025'  '026' '027' '028' '029' '030' '031'  '032' '033' '034' '035' '036' '037' '038' '039' '040' '041' '042' '043' '044' '045' '046' '047' '048' '049' '050' '101' '102' '103' '104' '105' '106' '107' '108' '109' '110' '111' '112' '113' '114' '115' '116' '117' '118' '119' '120' '121' '122' '123' '124' '125' '126' '127' '128' '129' '130' '131' '132' '133' '134' '135' '136' '137' '138' '139' '140'}, [0  2], 'newname', strcat(token,' EEG epochs'), 'epochinfo', 'yes');
    EEG = eeg_checkset( EEG );
    [ALLEEG EEG CURRENTSET]=eeg_store(ALLEEG, EEG);
end

%{
EEG = pop_runica(EEG, 'extended',1,'interupt','on');
EEG = eeg_checkset( EEG );
Comp_topo=EEG.icaweights*EEG.icasphere;
component_to_remove=[];
for j=1:size(Comp_topo,1)
    fr_pow=mean(Comp_topo([1:3,5,7],j));
    back_pow=mean(Comp_topo([4,6,8:end],j));
    back10=abs(back_pow)*12;
    if abs(fr_pow)>=back10
        component_to_remove=[component_to_remove,j];
    end
end

EEG=pop_subcomp(EEG,component_to_remove);
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET]=eeg_store(ALLEEG, EEG);
EEG = eeg_checkset( EEG );
%}
EEG = pop_saveset( EEG, 'filename',strcat(token,' epochs.set'),'filepath','/Users/gigel/Documents/Speech EEG/Experiment 1/EEG files/Epoched data/');
EEG = eeg_checkset( EEG );
end

close(h);