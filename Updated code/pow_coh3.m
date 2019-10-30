function C_pow=pow_coh3(eegspects)
Amp=sqrt(eegspects.*conj(eegspects));
%Amp=abs(eegspects).^2;
Meanamp=mean(Amp,4);
Den=(Amp.^2-Meanamp.^2).^2;
C_pow=sqrt(mean(Den,4))./Meanamp.^2;
C_pow=squeeze(C_pow);
