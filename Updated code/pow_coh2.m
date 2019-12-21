%calculates power coherence (see Luo and Poeppel, 2007) between EEG trials 

function C_pow=pow_coh2(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_pow = zeros(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(A,1),size(eegspects,5));

for i=1:size(C_pow,1)
    for j=1:size(C_pow,2)
        for l=1:size(C_pow,3)
            for h=1:size(C_pow,4)
                for g=1:size(C_pow,5)
                    eegpow1=eegspects(i,j,l,A(h,1),g,:);   %spectrogram of EEG trial 1
                    eegpow2=eegspects(i,j,l,A(h,2),g,:);   %spectrogram of EEG trial 2
                    Amp=abs(eegpow1.*conj(eegpow2));       %magnitude of the resultant vector between the two trials
                    meanamp=mean(Amp,6);
                    C_pow(i,j,l,h,g)=sqrt(mean((Amp.^2-meanamp.^2).^2,6))./meanamp.^2;  %power coherence between trials 1 and 2
                end
             end
         end
     end
end
