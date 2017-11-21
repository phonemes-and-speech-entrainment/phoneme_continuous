function S=getspects(D)

F1 = 1:0.5:10;
F2 = 10:1:40;
F  = [F1,F2];
N  = size(D,2);
nsc = floor(N/2);
nov = 900;


S = NaN(size(D,1),size(D,3),size(D,4),length(F),11);

for j=1:size(D,1)
    for l=1:size(D,3)
        for h=1:size(D,4)
            if ~isnan(D(j,:,l,h))
        [s,~,~]=spectrogram(D(j,:,l,h),hann(nsc),nov,F,1000);
        S(j,l,h,:,:)=s;
            end; 
        end;
    end;
end;




 





