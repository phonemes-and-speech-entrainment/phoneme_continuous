function [engs,engw,russ,rusw]=get_itc_all(Engs)
F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];
Fs = 1000;
N  = 2000;
nsc = floor(N/2);
nov = 900;

v=[1,2,3,4];
k=2;

A=combnk(v,k);
A=flipud(A);
itc=NaN(size(Engs,1),length(F),size(Engs,3),size(A,1));

for i=1:size(Engs,1)
    for j=1:size(Engs,3)
    for h=1:size(A,1)
        if ~isnan(Engs(i,:,j,A(h,:)))
            temp1=reshape(Engs(i,:,j,A(h,1)),size(Engs,2),1);
            temp2=reshape(Engs(i,:,j,A(h,2)),size(Engs,2),1);
            [cxy,~]=mscohere(temp1,temp2,hann(nsc),nov,F,Fs);
            itc(i,:,j,h)=cxy;
        end
    end
    end
end

itc_mean=nanmean(itc,4);

engs=itc_mean(:,:,1:20);
engw=itc_mean(:,:,21:40);
russ=itc_mean(:,:,41:60);
rusw=itc_mean(:,:,61:80);

%sengs=nanstd(engs,0,3);
%sengw=nanstd(engw,0,3);
%sruss=nanstd(russ,0,3);
%srusw=nanstd(rusw,0,3);

%for i=1:size(engs,3)
%engs(:,:,i)=engs(:,:,i)./sengs;
%engw(:,:,i)=engw(:,:,i)./sengw;
%russ(:,:,i)=russ(:,:,i)./sruss;
%rusw(:,:,i)=rusw(:,:,i)./srusw;
%end


