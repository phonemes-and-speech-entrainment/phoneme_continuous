function Datanew=get_chan_all_subjects(EEG,a)
type = {EEG(a).event.type}.';
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


Data=EEG(a).data;

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
Datanew=reshape(Datanew,1,size(Datanew,1),size(Datanew,2),size(Datanew,3),size(Datanew,4));

