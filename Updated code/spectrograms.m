clearvars;
load('Data_baseline.mat');

%Data=Datanew(:,:,501:end,:,:);
Data=Datanew;

F1 = 1:0.1:10;
F2 = 10:1:40;
F  = [F1,F2];
N  = size(Data,3);
nsc = floor(N/2);
nov = 740;


Spects = zeros(size(Data,1),size(Data,2),size(Data,4),size(Data,5),length(F),76);

h=waitbar(0,'Please wait...');

for i=1:size(Data,1)
    for j=1:size(Data,2)
        for l=1:size(Data,4)
            for h=1:size(Data,5)
                if ~isnan(Data(i,j,:,l,h))
                waitbar(i/size(Data,1))
                [s,~,~]=spectrogram(squeeze(Data(i,j,:,l,h)),hann(nsc),nov,F,1000);
                %s=reshape(s,1,1,1,1,size(s,1),size(s,2));
                Spects(i,j,l,h,:,:)=s;
                end
            end
        end
    end
end

close(h);