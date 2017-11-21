function C_phase_rand=itc_phase_rand_all(eegspects)
ordering = randperm(size(eegspects,2));
eegspects_rand=eegspects(:,ordering,:,:,:);


v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_phase_rand = NaN(size(eegspects,1),size(eegspects,2),size(eegspects,4),size(A,1));



for j=1:size(C_phase_rand,1)
    for l=1:size(C_phase_rand,2)
        for h=1:size(C_phase_rand,3)
            for g=1:size(A,1)
                if isequal(~isnan(eegspects(j,l,A(g,:),h,:)),~isnan(eegspects_rand(j,l,A(g,:),h,:)))
      eegpow1=eegspects(j,l,A(g,1),h,:);
      eegpow1=reshape(eegpow1,1,11);
      eegpow2=eegspects_rand(j,l,A(g,2),h,:);
      eegpow2=reshape(eegpow2,1,11);
      phase=angle(eegpow1.*conj(eegpow2));
      cosinus=cos(phase);
      sinus=sin(phase);
      C_phase_rand(j,l,h,g)=nanmean(cosinus)^2 + nanmean(sinus)^2;
                end;
            end
        end
    end
end

%dev=nanstd(C_phase_rand,0,1);


C_phase_rand=nanmean(C_phase_rand,4);
%C_phase_rand=reshape(C_phase_rand,size(C_phase_rand,1),size(C_phase_rand,3),size(C_phase_rand,4));

%dev = reshape(dev,size(C_phase_rand,1),size(C_phase_rand,2),size(C_phase_rand,3));