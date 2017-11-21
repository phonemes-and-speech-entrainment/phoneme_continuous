function [eng,rus]=itc_power(eegspects)

v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
C_power = NaN(size(eegspects,1),size(eegspects,2),size(A,1),size(eegspects,4));

t=size(eegspects,5);

for j=1:size(C_power,1)
    for l=1:size(C_power,2)
        for h=1:size(C_power,3)
            for g=1:size(C_power,4)
                if ~isnan(eegspects(j,l,A(h,:),g,:))
      eegpow1=eegspects(j,l,A(h,1),g,:);
      eegpow1=reshape(eegpow1,1,11);
      eegpow2=eegspects(j,l,A(h,2),g,:);
      eegpow2=reshape(eegpow2,1,11);
      miu1=sum(abs(eegpow1))/t;
      miu2=sum(abs(eegpow2))/t;
      sigma1=sqrt(1/t*sum((abs(eegpow1)-miu1).^2));
      sigma2=sqrt(1/t*sum((abs(eegpow2)-miu2).^2));
      C_power(j,l,h,g)=sum((abs(eegpow1)-miu1).*(abs(eegpow2)-miu2))/sigma1*sigma2;
                end
             end
         end
     end
end

eng=C_power(:,1:40,:,:);
%engw=C_power(:,2:2:40,:,:);
rus=C_power(:,41:80,:,:);
%rusw=C_power(:,42:2:80,:,:);

eng=nanmean(eng,2);
eng=reshape(eng,size(eng,1),size(eng,3),size(eng,4));

%engw=nanmean(engw,2);
%engw=reshape(engw,size(engw,1),size(engw,3),size(engw,4));

rus=nanmean(rus,2);
rus=reshape(rus,size(rus,1),size(rus,3),size(rus,4));

%rusw=nanmean(rusw,2);
%rusw=reshape(rusw,size(rusw,1),size(rusw,3),size(rusw,4));
