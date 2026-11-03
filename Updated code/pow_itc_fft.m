clearvars;
addpath('/Users/gigel/Documents/Speech EEG/Code /Entrainment_analysis/Experiment 2');


load('Data_sorted_by_events.mat');


%Data=Datanew(:,:,501:end,:,:);
Data = Datanew;

h=waitbar(0,'Please wait...');

Data_fft=zeros(size(Data));
for i=1:size(Data,1)
    for j=1:size(Data,2)
        for k=1:size(Data,4)
            for l=1:size(Data,5)
            waitbar(i/size(Data,1))
            temp=hann(size(Data,3)).*squeeze(Data(i,j,:,k,l));
            Data_fft(i,j,:,k,l)=fft(temp);
            end
        end
    end
end
close(h);  
%}



%load('Data_fft_without_500ms.mat');

Fs=1000;
n=2000;
freq = 0:Fs/n:Fs/2;
a=find(freq==40);
freq=freq(1:a);

%{

Data_fft=Data_fft(:,:,1:a,:,:);

pow2=Data_fft./abs(Data_fft);


itc=sum(pow2,5);
itc=(abs(itc)/10).^2;


Data_mean=mean(Data_fft,5);
evoked_pow=sqrt(Data_mean.*conj(Data_mean));
%evoked_pow=abs(Data_mean).^2;


%total_pow = abs(Data_fft).^2;
total_pow=sqrt(Data_fft.*conj(Data_fft));
total_pow = mean(total_pow,5);

evoked_without_noise=zeros(size(evoked_pow));
total_without_noise=zeros(size(total_pow));

l=size(evoked_pow,1);
m=size(evoked_pow,2);
p=size(evoked_pow,4);

for i=1:l
    for j=1:m
        for k=1:p
            temp1=evoked_pow(i,j,:,k);
            temp1=permute(temp1,[3 2 1]);
            temp2=remove_noise(temp1,freq');
            temp3=total_pow(i,j,:,k);
            temp3=permute(temp3,[3 2 1]);
            temp4=remove_noise(temp3,freq');
            evoked_without_noise(i,j,:,k)=temp2;
            total_without_noise(i,j,:,k)=temp4;
        end
    end
end


%meanitc=squeeze(mean(mean(mean(itc),2),4));

meanevoked=squeeze(mean(mean(mean(evoked_without_noise),2),4));

meantotal=squeeze(mean(mean(mean(total_without_noise),2),4));
%}

engs=itc(:,:,:,1:20);
engw=itc(:,:,:,21:40);
russ=itc(:,:,:,41:60);
rusw=itc(:,:,:,61:80);

meanengs=squeeze(mean(mean(mean(engs),2),4));
meanengw=squeeze(mean(mean(mean(engw),2),4));
meanruss=squeeze(mean(mean(mean(russ),2),4));
meanrusw=squeeze(mean(mean(mean(rusw),2),4));

figure;
plot(freq(3:end),meanengs(3:end));
hold on;
plot(freq(3:end),meanengw(3:end));
hold on;
plot(freq(3:end),meanruss(3:end));
hold on;
plot(freq(3:end),meanrusw(3:end));

figure;
plot(freq,meanevoked);
hold on;
plot(freq,meantotal);
