clearvars;
load('Data_baseline.mat');

%Datanew=Datanewnew(:,:,501:end,:,:);
Datanew=reshape(Datanew,size(Datanew,1),size(Datanew,2),size(Datanew,3),320);
Datanew=Datanew(:,:,:,randperm(320));
Datanew=reshape(Datanew,size(Datanew,1),size(Datanew,2),size(Datanew,3),80,4);

F1 = 1:0.1:10;
F2 = 10:1:40;
F  = [F1,F2];
N  = size(Datanew,3);
nsc = floor(N/2);
nov = 740;


Spects_rand = zeros(size(Datanew,1),size(Datanew,2),size(Datanew,4),size(Datanew,5),length(F),76);

h=waitbar(0,'Please wait...');

for i=1:size(Datanew,1)
    for j=1:size(Datanew,2)
        for l=1:size(Datanew,4)
            for h=1:size(Datanew,5)
                if ~isnan(Datanew(i,j,:,l,h))
                waitbar(i/size(Datanew,1))
                [s,~,~]=spectrogram(squeeze(Datanew(i,j,:,l,h)),hann(nsc),nov,F,1000);
                %s=reshape(s,1,1,1,1,size(s,1),size(s,2));
                Spects_rand(i,j,l,h,:,:)=s;
                end
            end
        end
    end
end

close(h);