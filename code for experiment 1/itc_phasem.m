function C_phase=itc_phasem(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_phase = NaN(size(eegspects,1),size(eegspects,2),size(A,1),size(eegspects,4));



for j=1:size(C_phase,1)
    for l=1:size(C_phase,2)
        for h=1:size(C_phase,3)
            for g=1:size(C_phase,4)
                if ~isnan(eegspects(j,l,A(h,:),g,:))
      eegpow1=eegspects(j,l,A(h,1),g,:);
      eegpow1=reshape(eegpow1,1,11);
      eegpow2=eegspects(j,l,A(h,2),g,:);
      eegpow2=reshape(eegpow2,1,11);
      eegpow=eegpow1.*conj(eegpow2);
      phase=eegpow./abs(eegpow);
      cosine=real(phase);
      sine=imag(phase);
      C_phase(j,l,h,g)=mean(cosine)^2+mean(sine)^2;      
                end
             end
         end
     end
end

C_phase=nanmean(C_phase,3);
C_phase=reshape(C_phase,size(C_phase,1),size(C_phase,2),size(C_phase,4));
