
logspace=linspace(log10(80),log10(8000),33);
freqband=power(10,logspace);
for i=1:length(freqband)
    if freqband(i)<1000
        freqband(i)=roundn(freqband(i),1);
    else freqband(i)=roundn(freqband(i),2);
    end
end

files = dir('*.wav');


X = zeros(length(files));
addpath('O:\Documents\Documents\code_sharpness');

for i = 1:length(files)
    [sound, Fs] = audioread(files(i).name);
    env = get_sharpness(sound,Fs,freqband);
    X(i) = env;
    disp(X(i));
end