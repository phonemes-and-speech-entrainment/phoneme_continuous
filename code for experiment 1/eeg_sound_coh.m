function C_power=eeg_sound_coh(eegspects,soundpow)
C_power = NaN(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(eegspects,4));

for j=1:size(C_power,1)
    for l=1:size(C_power,2)
        for h=1:size(C_power,3)
            for g=1:size(C_power,4)
                if ~isnan(eegspects(j,l,h,g,:))
      eegpow=eegspects(j,l,h,g,:);
      eegpow=reshape(eegpow,1,11);
      soundp=soundpow(l,g,:);
      sp=reshape(soundp,1,11);
      %pow=conj(eegpow).*sp;
      %C_power(j,l,h,g)=abs(sum(pow)/sqrt(sum(eegpow.*conj(eegpow))*sum(sp.*conj(sp))));
      phase=angle(eegpow.*conj(sp));
      cosine=cos(phase);
      sine=sin(phase);
      C_power(j,l,h,g)=mean(cosine)^2+mean(sine)^2;  
                end
            end
        end
    end
end




