C_power_engs_all=cat(4,Cpower_engs7,Cpower_engs9,Cpower_engs10,Cpower_engs11,...
Cpower_engs12,Cpower_engs14,Cpower_engs16,Cpower_engs18,...
Cpower_engs20,Cpower_engs23,Cpower_engs24,Cpower_engs25,Cpower_engs26,...
Cpower_engs27,Cpower_engs28,Cpower_engs29,Cpower_engs30,Cpower_engs31,Cpower_engs32);

C_power_engw_all=cat(4,Cpower_engw7,Cpower_engw9,Cpower_engw10,Cpower_engw11,...
Cpower_engw12,Cpower_engw14,Cpower_engw16,Cpower_engw18,...
Cpower_engw20,Cpower_engw23,Cpower_engw24,Cpower_engw25,Cpower_engw26,...
Cpower_engw27,Cpower_engw28,Cpower_engw29,Cpower_engw30,Cpower_engw31,Cpower_engw32);

Cpower_russ_all=cat(4,Cpower_russ7,Cpower_russ9,Cpower_russ10,Cpower_russ11,...
Cpower_russ12,Cpower_russ14,Cpower_russ16,Cpower_russ18,...
Cpower_russ20,Cpower_russ23,Cpower_russ24,Cpower_russ25,Cpower_russ26,...
Cpower_russ27,Cpower_russ28,Cpower_russ29,Cpower_russ30,Cpower_russ31,Cpower_russ32);

Cpower_rusw_all=cat(4,Cpower_rusw7,Cpower_rusw9,Cpower_rusw10,Cpower_rusw11,...
Cpower_rusw12,Cpower_rusw14,Cpower_rusw16,Cpower_rusw18,...
Cpower_rusw20,Cpower_rusw23,Cpower_rusw24,Cpower_rusw25,Cpower_rusw26,...
Cpower_rusw27,Cpower_rusw28,Cpower_rusw29,Cpower_rusw30,Cpower_rusw31,Cpower_rusw32);

Cpow_engs_subavg=mean(C_power_engs_all,4)
Cpow_engs_subavg=reshape(Cpow_engs_subavg,6,50,20);

Cpow_engw_subavg=mean(C_power_engw_all,4)
Cpow_engw_subavg=reshape(Cpow_engw_subavg,6,50,20);

Cpow_russ_subavg=mean(Cpower_russ_all,4)
Cpow_russ_subavg=reshape(Cpow_russ_subavg,6,50,20);

Cpow_rusw_subavg=mean(Cpower_rusw_all,4)
Cpow_rusw_subavg=reshape(Cpow_rusw_subavg,6,50,20);


Cpow_engs_chanavg=mean(Cpow_engs_subavg,1);
Cpow_engs_chanavg=reshape(Cpow_engs_chanavg,50,20);

Cpow_engw_chanavg=mean(Cpow_engw_subavg,1);
Cpow_engw_chanavg=reshape(Cpow_engw_chanavg,50,20);

Cpow_russ_chanavg=mean(Cpow_russ_subavg,1);
Cpow_russ_chanavg=reshape(Cpow_russ_chanavg,50,20);

Cpow_rusw_chanavg=mean(Cpow_rusw_subavg,1);
Cpow_rusw_chanavg=reshape(Cpow_rusw_chanavg,50,20);

Cpow_engs=mean(Cpow_engs_chanavg,2);
Cpow_engw=mean(Cpow_engw_chanavg,2);
Cpow_russ=mean(Cpow_russ_chanavg,2);
Cpow_rusw=mean(Cpow_rusw_chanavg,2);


figure;
plot(F,Cpow_engs);
hold on;
plot(F,Cpow_engw);
hold on;
plot(F,Cpow_russ);
hold on;
plot(F,Cpow_rusw);
legend('english strong','english weak','russian strong','russian weak');




engs_theta=Cpow_engs(7:13);
engs_gamma=Cpow_engs(25:40);

engw_theta=Cpow_engw(7:13);
engw_gamma=Cpow_engw(25:40);

russ_theta=Cpow_russ(7:13);
russ_gamma=Cpow_engw(25:40);

rusw_theta=Cpow_rusw(7:13);
rusw_gamma=Cpow_rusw(25:40);


Cpow_engs_cavg=mean(C_power_engs_all,1)
Cpow_engs_cavg=reshape(Cpow_engs_cavg,50,20,19);

Cpow_engw_cavg=mean(C_power_engw_all,1)
Cpow_engw_cavg=reshape(Cpow_engw_cavg,50,20,19);

Cpow_russ_cavg=mean(Cpower_russ_all,1)
Cpow_russ_cavg=reshape(Cpow_russ_cavg,50,20,19);

Cpow_rusw_cavg=mean(Cpower_rusw_all,1)
Cpow_rusw_cavg=reshape(Cpow_rusw_cavg,50,20,19);



Cpow_engs_sentavg=mean(Cpow_engs_cavg,2)
Cpow_engs_sentavg=reshape(Cpow_engs_sentavg,50,19);

Cpow_engw_sentavg=mean(Cpow_engw_cavg,2)
Cpow_engw_sentavg=reshape(Cpow_engw_sentavg,50,19);

Cpow_russ_sentavg=mean(Cpow_russ_cavg,2)
Cpow_russ_sentavg=reshape(Cpow_russ_sentavg,50,19);

Cpow_rusw_sentavg=mean(Cpow_rusw_cavg,2)
Cpow_rusw_sentavg=reshape(Cpow_rusw_sentavg,50,19);

engs_theta=Cpow_engs_sentavg(7:13,:);
es_theta=mean(engs_theta,1);
engs_gamma=Cpow_engs_sentavg(25:40,:);
es_gamma=mean(engs_gamma,1);

engw_theta=Cpow_engw_sentavg(7:13,:);
ew_theta=mean(engw_theta,1);
engw_gamma=Cpow_engw_sentavg(25:40,:);
ew_gamma=mean(engw_gamma,1);

russ_theta=Cpow_russ_sentavg(7:13,:);
rs_theta=mean(russ_theta,1);
russ_gamma=Cpow_engw_sentavg(25:40,:);
rs_gamma=mean(russ_gamma,1);

rusw_theta=Cpow_rusw_sentavg(7:13,:);
rw_theta=mean(rusw_theta,1);
rusw_gamma=Cpow_rusw_sentavg(25:40,:);
rw_gamma=mean(rusw_gamma,1);









