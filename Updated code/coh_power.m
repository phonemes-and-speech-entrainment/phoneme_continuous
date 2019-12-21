%calculates power coherence (see Luo and Poeppel, 2007) between EEG trials 

function C_power=coh_power(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k); %matrix of combinations of n elements taken k at a time
A=flipud(A);   %flip matrix so that this starts with trial 1
C_power = zeros(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(A,1),size(eegspects,5));

t=size(eegspects,5);

for i=1:size(C_power,1)
    for j=1:size(C_power,2)
        for l=1:size(C_power,3)
            for h=1:size(C_power,4)
                for g=1:size(C_power,5)
                    eegpow1=eegspects(i,j,l,A(h,1),g,:);   %spectrogram of EEG trial 1
                    eegpow1=reshape(eegpow1,1,76);
                    eegpow2=eegspects(i,j,l,A(h,2),g,:);   %spectrogram of EEG trial 2
                    eegpow2=reshape(eegpow2,1,76);
                    miu1=sum(abs(eegpow1))/t;              %total power of trial 1 normalised over time vector
                    miu2=sum(abs(eegpow2))/t;              %total power of trial 2 normalised over time vector
                    %sigma1=sqrt(1/t*sum((abs(eegpow1)-miu1).^2));
                    %sigma2=sqrt(1/t*sum((abs(eegpow2)-miu2).^2));
                    C_power(i,j,l,h,g)=sum((abs(eegpow1)-miu1).*(abs(eegpow2)-miu2))/miu1*miu2; %power coherence between trials 1 and 2
                end
             end
         end
     end
end


