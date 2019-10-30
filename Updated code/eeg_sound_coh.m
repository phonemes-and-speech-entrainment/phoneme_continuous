function C_power=eeg_sound_coh(eegspects,soundspects)
C_power = zeros(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(eegspects,4),size(eegspects,5));

for i=1:size(C_power,1)
    for j=1:size(C_power,2)
        for l=1:size(C_power,4)
                eegpow=eegspects(i,j,:,l,:,:);
                eegpow=reshape(eegpow,size(soundspects));
                phase=angle(eegpow.*conj(soundspects));
                cosine=cos(phase);
                sine=sin(phase);
                temp=mean(cosine,3).^2+mean(sine,3).^2;  
                C_power(i,j,:,l,:)=reshape(temp,1,1,size(eegspects,3),1,size(eegspects,5));
         end
    end
end




