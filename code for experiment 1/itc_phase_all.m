function C_phase=itc_phase_all(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_phase = NaN(size(eegspects,1),size(eegspects,2),size(eegspects,4),size(A,1));




for j=1:size(C_phase,1)
    for l=1:size(C_phase,2)
        for h=1:size(C_phase,3)
            for g=1:size(A,1)
                if ~isnan(eegspects(j,l,A(g,:),h,:))
      eegpow1=eegspects(j,l,A(g,1),h,:);
      eegpow1=reshape(eegpow1,1,11);
      eegpow2=eegspects(j,l,A(g,2),h,:);
      eegpow2=reshape(eegpow2,1,11);
      phase=angle(eegpow1.*conj(eegpow2));
      cosinus=cos(phase);
      sinus=sin(phase);     
      C_phase(j,l,h,g)=nanmean(cosinus)^2 + nanmean(sinus)^2;
                end;
            end;
        end;
    end;
end;



C_phase=nanmean(C_phase,4);


