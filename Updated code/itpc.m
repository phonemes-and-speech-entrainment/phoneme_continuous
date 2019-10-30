function C_phase=itpc(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_phase = zeros(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(A,1),size(eegspects,5));


for i=1:size(C_phase,1)
    for j=1:size(C_phase,2)
        for l=1:size(C_phase,3)
            for h=1:size(C_phase,4)
                for g=1:size(C_phase,5)
                    eegpow1=eegspects(i,j,l,A(h,1),g,:);
                    eegpow1=reshape(eegpow1,1,76);
                    eegpow2=eegspects(i,j,l,A(h,2),g,:);
                    eegpow2=reshape(eegpow2,1,76);
                    phase=angle(eegpow1.*conj(eegpow2));
                    cosine=cos(phase);
                    sine=sin(phase);
                    C_phase(i,j,l,h,g)=mean(cosine).^2+mean(sine).^2; 
                end
             end
         end
    end 
end