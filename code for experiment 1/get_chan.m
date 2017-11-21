function [Engs,Engw,Russ,Rusw]=get_chan(EEG)
type = {EEG(1).event.type}.';
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


Data=EEG(1).data;

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

Engs=Datanew(:,:,1:20,:);
Engw=Datanew(:,:,21:40,:);
Russ=Datanew(:,:,41:60,:);
Rusw=Datanew(:,:,61:80,:);