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
  
  
Spects=getspects(Datanew);

C_phase=itc_phase(Spects);
C_phase_rand=itc_phase_rand(Spects);
C_phase_all=C_phase-C_phase_rand;

C_phase_engs=C_phase_all(:,1:20,:);
C_phase_engw=C_phase_all(:,21:40,:);
C_phase_russ=C_phase_all(:,41:60,:);
C_phase_rusw=C_phase_all(:,61:80,:);
Phengs=mean(C_phase_engs,2);
Phengs=reshape(Phengs,size(Datanew,1),50);
figure;
plot(F,Phengs(14,:));

Phruss=mean(C_phase_russ,2);
Phruss=reshape(Phruss,size(Datanew,1),50);
figure;
plot(F,Phruss(14,:));

