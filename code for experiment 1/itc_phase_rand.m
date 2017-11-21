function [strong,weak]=itc_phase_rand(eegspects)

ordering1 = datasample(1:2:80,40,'replace',false);
ordering2 = datasample(2:2:80,40,'replace',false);
%ordering3 = datasample(41:2:80,20,'replace',false);
%ordering4 = datasample(42:2:80,20,'replace',false);
ordering = [ordering1,ordering2];
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
      phase=angle(eegpow1.*conj(eegpow2));
      cosine=cos(phase);
      sine=sin(phase);
      C_phase_rand(j,l,h,g)=mean(cosine)^2+mean(sine)^2;  
                end
            end
        end
    end
end

strong=C_phase_rand(:,1:2:80,:,:);
weak=C_phase_rand(:,2:2:80,:,:);
%russ=C_phase_rand(:,41:2:80,:,:);
%rusw=C_phase_rand(:,42:2:80,:,:);

%sengs=nanstd(engs,0,2);
%sengw=nanstd(engw,0,2);
%sruss=nanstd(russ,0,2);
%srusw=nanstd(rusw,0,2);

strong=nanmean(strong,2);
strong=reshape(strong,size(strong,1),size(strong,3),size(strong,4));

weak=nanmean(weak,2);
weak=reshape(weak,size(weak,1),size(weak,3),size(weak,4));

%russ=nanmean(russ,2);
%russ=reshape(russ,size(russ,1),size(russ,3),size(russ,4));

%rusw=nanmean(rusw,2);
%rusw=reshape(rusw,size(rusw,1),size(rusw,3),size(rusw,4));

%sengs=reshape(sengs,size(engs,1),size(engs,2),size(engs,3));
%sengw=reshape(sengw,size(engw,1),size(engw,2),size(engw,3));
%sruss=reshape(sruss,size(russ,1),size(russ,2),size(russ,3));
%srusw=reshape(srusw,size(rusw,1),size(rusw,2),size(rusw,3));
