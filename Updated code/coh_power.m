function C_power=coh_power(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_power = zeros(size(eegspects,1),size(eegspects,2),size(eegspects,3),size(A,1),size(eegspects,5));

t=size(eegspects,5);

for i=1:size(C_power,1)
    for j=1:size(C_power,2)
        for l=1:size(C_power,3)
            for h=1:size(C_power,4)
                for g=1:size(C_power,5)
                    eegpow1=eegspects(i,j,l,A(h,1),g,:);
                    eegpow1=reshape(eegpow1,1,76);
                    eegpow2=eegspects(i,j,l,A(h,2),g,:);
                    eegpow2=reshape(eegpow2,1,76);
                    miu1=sum(abs(eegpow1))/t;
                    miu2=sum(abs(eegpow2))/t;
                    %sigma1=sqrt(1/t*sum((abs(eegpow1)-miu1).^2));
                    %sigma2=sqrt(1/t*sum((abs(eegpow2)-miu2).^2));
                    C_power(i,j,l,h,g)=sum((abs(eegpow1)-miu1).*(abs(eegpow2)-miu2))/miu1*miu2;
                end
             end
         end
     end
end


