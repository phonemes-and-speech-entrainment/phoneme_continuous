function [engs,engw,russ,rusw]=itc_phase(eegspects)

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
      phase=angle(eegpow1.*conj(eegpow2));
      cosine=cos(phase);
      sine=sin(phase);
      C_phase(j,l,h,g)=mean(cosine)^2+mean(sine)^2;      
                end
             end
         end
    end 
end

engs=C_phase(:,1:2:40,:,:);
engw=C_phase(:,2:2:40,:,:);
russ=C_phase(:,41:2:80,:,:);
rusw=C_phase(:,42:2:80,:,:);
%russ=C_phase(:,41:2:80,:,:);
%rusw=C_phase(:,42:2:80,:,:);

engs=nanmean(engs,2);
engs=reshape(engs,size(engs,1),size(engs,3),size(engs,4));

engw=nanmean(engw,2);
engw=reshape(engw,size(engw,1),size(engw,3),size(engw,4));

russ=nanmean(russ,2);
russ=reshape(russ,size(russ,1),size(russ,3),size(russ,4));

rusw=nanmean(rusw,2);
rusw=reshape(rusw,size(rusw,1),size(rusw,3),size(rusw,4));

%russ=nanmean(russ,2);
%russ=reshape(russ,size(russ,1),size(russ,3),size(russ,4));

%rusw=nanmean(rusw,2);
%rusw=reshape(rusw,size(rusw,1),size(rusw,3),size(rusw,4));










