function [C_power_rand,dev]=itc_power_rand_all_cond(eegspects)
ordering = randperm(size(eegspects,2));
eegspects_rand=eegspects(:,ordering,:,:,:);


v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_power_rand = NaN(size(eegspects,1),size(eegspects,2),size(A,1),size(eegspects,4));
t=size(eegspects,5);


for j=1:size(C_power_rand,1)
    for l=1:size(C_power_rand,2)
        for h=1:size(C_power_rand,3)
            for g=1:size(C_power_rand,4)
                if isequal(~isnan(eegspects(j,l,A(h,:),g,:)),~isnan(eegspects_rand(j,l,A(h,:),g,:)))
      eegpow1=eegspects(j,l,A(h,1),g,:);
      eegpow1=reshape(eegpow1,1,11);
      eegpow2=eegspects_rand(j,l,A(h,2),g,:);
      eegpow2=reshape(eegpow2,1,11);
      miu1=sum(abs(eegpow1))/t;
      miu2=sum(abs(eegpow2))/t;
      sigma1=sqrt(1/t*sum((abs(eegpow1)-miu1).^2));
      sigma2=sqrt(1/t*sum((abs(eegpow2)-miu2).^2));
      C_power_rand(j,l,h,g)=sum((abs(eegpow1)-miu1).*(abs(eegpow2)-miu2))/sigma1*sigma2;    
                end
            end
        end
    end
end

dev=nanstd(C_power_rand,0,2);


C_power_rand=nanmean(C_power_rand,2);
C_power_rand=reshape(C_power_rand,size(C_power_rand,1),size(C_power_rand,3),size(C_power_rand,4));

dev=reshape(dev,size(C_power_rand,1),size(C_power_rand,2),size(C_power_rand,3));