function C_phase_rand=itc_phase_randm(eegspects)

ordering = randperm(size(eegspects,2));
eegspects_rand=eegspects(:,ordering,:,:,:);


v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_phase_rand = NaN(size(eegspects,1),size(eegspects,2),size(A,1),size(eegspects,4));


for j=1:size(C_phase_rand,1)
    for l=1:size(C_phase_rand,2)
        for h=1:size(C_phase_rand,3)
            for g=1:size(C_phase_rand,4)
                if isequal(~isnan(eegspects(j,l,A(h,:),g,:)),~isnan(eegspects_rand(j,l,A(h,:),g,:)))
      eegpow1=eegspects(j,l,A(h,1),g,:);
      eegpow1=reshape(eegpow1,1,11);
      eegpow2=eegspects_rand(j,l,A(h,2),g,:);
      eegpow2=reshape(eegpow2,1,11);
      eegpow=eegpow1.*conj(eegpow2);
      phase=eegpow./abs(eegpow);
      cosine=real(phase);
      sine=imag(phase);
      C_phase_rand(j,l,h,g)=mean(cosine)^2+mean(sine)^2;  
                end
            end
        end
    end
end

C_phase_rand=nanmean(C_phase_rand,3);
C_phase_rand=reshape(C_phase_rand,size(C_phase_rand,1),size(C_phase_rand,2),size(C_phase_rand,4));
