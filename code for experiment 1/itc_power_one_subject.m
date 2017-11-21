%%
type = {EEG.event.type}.';
event_type=char(type);
for i=1:length(event_type)
event_type(i,1)=strrep(event_type(i,1),'S','0');
if(event_type(i,2)==' ')
   event_type(i,2)=strrep(event_type(i,2),' ','0');
end
end
event_type=str2double(event_type);
%event_type(isnan(event_type))=0;
event_type=event_type';


Data=EEG.data;
%Data=[Data(5,:,:);Data(14,:,:);Data(25,:,:)];

u=unique(event_type);
n=histc(event_type,u);
index=NaN(length(u),4);
for i=1:length(n)
if n(i)>0
inx=find(event_type==u(i));
indx=[inx,NaN(1,4-length(inx))];
index(i,:)=indx;
end;
end;

Data2=NaN(size(Data,1),size(Data,2),size(index,1),size(index,2));

for i=1:size(index,1)
    for j=1:size(index,2)
        if ~isnan(index(i,j))
            temp=Data(:,:,index(i,j));
            temp=reshape(temp,size(Data,1),size(Data,2),1,1);
            Data2(:,:,i,j)=temp;
        end
    end 
end



Datanew = Data2;
Datanew(:,:,[41:50, 91:100],:) = [];
  
%%  
Spects=getspects(Datanew);


%compute power weighted coherence
ordering = randperm(size(Spects,2));
Spects_rand=Spects(:,ordering,:,:,:);


v=[1,2,3,4];
k=2;



A=combnk(v,k);
A=flipud(A);
C_power_rand = NaN(size(Spects,1),size(Spects,2),size(A,1),size(Spects,4));
t=size(Spects,5);

for j=1:size(C_power_rand,1)
    for l=1:size(C_power_rand,2)
        for h=1:size(C_power_rand,3)
            for g=1:size(C_power_rand,4)
                if isequal(~isnan(Spects(j,l,A(h,:),g,:)),~isnan(Spects_rand(j,l,A(h,:),g,:)))
      eegpow1=Spects(j,l,A(h,1),g,:);
      eegpow1=reshape(eegpow1,1,11);
      eegpow2=Spects_rand(j,l,A(h,2),g,:);
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

engs=C_power_rand(:,1:20,:,:);
engw=C_power_rand(:,21:40,:,:);
russ=C_power_rand(:,41:60,:,:);
rusw=C_power_rand(:,61:80,:,:);

sengs=nanstd(engs,0,2);
sengw=nanstd(engw,0,2);
sruss=nanstd(russ,0,2);
srusw=nanstd(rusw,0,2);


for i=1:size(engs,2)
engs(:,i,:,:)=engs(:,i,:,:)./sengs;
engw(:,i,:,:)=engw(:,i,:,:)./sengw;
russ(:,i,:,:)=russ(:,i,:,:)./sruss;
rusw(:,i,:,:)=rusw(:,i,:,:)./srusw;
end

engs=nanmean(engs,3);
engs=reshape(engs,size(engs,1),size(engs,2),size(engs,4));

engw=nanmean(engw,3);
engw=reshape(engw,size(engw,1),size(engw,2),size(engw,4));

russ=nanmean(russ,3);
russ=reshape(russ,size(russ,1),size(russ,2),size(russ,4));

rusw=nanmean(rusw,3);
rusw=reshape(rusw,size(rusw,1),size(rusw,2),size(rusw,4));