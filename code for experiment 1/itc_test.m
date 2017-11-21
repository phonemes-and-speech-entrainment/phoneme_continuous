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
itc=NaN(size(Datanew,1),length(F),size(Engs,3),size(A,1));

for i=1:size(Engs,1)
    for j=1:size(A,1)
        if ~isnan(Engs(i,:,:,A(j,:)))
            temp1=reshape(Engs(i,:,:,A(j,1)),2000,20);
            temp2=reshape(Engs(i,:,:,A(j,2)),2000,20);
            [cxy,~]=mscohere(temp1,temp2,hann(nsc),nov,F,Fs);
            itc(i,:,:,j)=cxy;
        end
    end
end

itc_mean=nanmean(itc,4);
            