%calculates power coherence (see Luo and Poeppel, 2007) between EEG trials 

function C_phase=itpc(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k); %matrix of combinations of n elements taken k at a time
A=flipud(A);   %flip matrix so that this starts with trial 1
C_phase = zeros(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(A,1),size(eegspects,5));


for i=1:size(C_phase,1)
    for j=1:size(C_phase,2)
        for l=1:size(C_phase,3)
            for h=1:size(C_phase,4)
                for g=1:size(C_phase,5)
                    eegpow1=eegspects(i,j,l,A(h,1),g,:);   %spectrogram of EEG trial 1
                    eegpow1=reshape(eegpow1,1,76);
                    eegpow2=eegspects(i,j,l,A(h,2),g,:);   %spectrogram of EEG trial 2
                    eegpow2=reshape(eegpow2,1,76);
                    phase=angle(eegpow1.*conj(eegpow2));   %phase between the spectrograms of the two trials
                    cosine=cos(phase);                     %cosine of the phase
                    sine=sin(phase);                       %sine of the phase
                    C_phase(i,j,l,h,g)=mean(cosine).^2+mean(sine).^2; %phase coherence between trials 1 and 2
                end
             end
         end
    end 
end
