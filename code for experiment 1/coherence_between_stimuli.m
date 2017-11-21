Fs = 44100;
F1 = [1:0.5:10];
F2 = [10:1:40];
N  = length(sumenv1);
nsc = floor(N/10);
nov = floor(nsc/2);

[s1,f1,t1] = spectrogram(sumenv1,hann(nsc),nov,F1,Fs);
[s2,f2,t2] = spectrogram(sumenv1,hann(nsc),nov,F2,Fs);

%should get t1=t2;

s = [s1;s2]; 

[z1,v1,p1] = spectrogram(sumenv2,hann(nsc),nov,F1,Fs);
[z2,v2,p2] = spectrogram(sumenv2(1:m),hann(nsc),nov,F2,Fs);

z=[z1;z2];

phdiff=angle(sumenv1(1:m))-angle(sumenv2(1:m));

% find iteration as floor(Fs*t1(1)), end as length(t1)*floor(Fs*t1(1))
bg=floor(Fs*t1(1));
en=length(p1)*bg;
phase=phdiff(bg:bg:en)';
coh = [];
for j = 1:size(s,1)
pow=z(j,:).*s(j,:);
temp = abs(sum(exp(i*phase).*sqrt(pow)))/sqrt(sum(pow));
coh=[coh,temp];
end








