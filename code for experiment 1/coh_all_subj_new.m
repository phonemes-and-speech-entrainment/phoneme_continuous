C_power_engs_all=cat(4,engs7,engs9,engs10,engs11,engs12,engs14,engs16,engs18,...
engs20,engs23,engs24,engs25,engs26,engs27,engs13,engs29,engs30,engs31,engs32);

C_power_engw_all=cat(4,engw7,engw9,engw10,engw11,engw12,engw14,engw16,engw18,...
engw20,engw23,engw24,engw25,engw26,engw27,engw13,engw29,engw30,engw31,engw32);

Cpower_russ_all=cat(4,russ7,russ9,russ10,russ11,russ12,russ14,russ16,russ18,...
russ20,russ23,russ24,russ25,russ26,russ27,russ13,russ29,russ30,russ31,russ32);

Cpower_rusw_all=cat(4,rusw7,rusw9,rusw10,rusw11,rusw12,rusw14,rusw16,rusw18,...
rusw20,rusw23,rusw24,rusw25,rusw26,rusw27,rusw13,rusw29,rusw30,rusw31,rusw32);


Cpow_engs_cavg=mean(C_power_engs_all,1)
Cpow_engs_cavg=reshape(Cpow_engs_cavg,20,50,19);

Cpow_engw_cavg=mean(C_power_engw_all,1)
Cpow_engw_cavg=reshape(Cpow_engw_cavg,20,50,19);

Cpow_russ_cavg=mean(Cpower_russ_all,1)
Cpow_russ_cavg=reshape(Cpow_russ_cavg,20,50,19);

Cpow_rusw_cavg=mean(Cpower_rusw_all,1)
Cpow_rusw_cavg=reshape(Cpow_rusw_cavg,20,50,19);



Cpow_engs_sentavg=mean(Cpow_engs_cavg)
Cpow_engs_sentavg=reshape(Cpow_engs_sentavg,50,19);

Cpow_engw_sentavg=mean(Cpow_engw_cavg)
Cpow_engw_sentavg=reshape(Cpow_engw_sentavg,50,19);

Cpow_russ_sentavg=mean(Cpow_russ_cavg)
Cpow_russ_sentavg=reshape(Cpow_russ_sentavg,50,19);

Cpow_rusw_sentavg=mean(Cpow_rusw_cavg)
Cpow_rusw_sentavg=reshape(Cpow_rusw_sentavg,50,19);

engs=mean(Cpow_engs_sentavg,2);
engw=mean(Cpow_engw_sentavg,2);
russ=mean(Cpow_russ_sentavg,2);
rusw=mean(Cpow_rusw_sentavg,2);

figure;
plot(F,engs);
hold on;
plot(F,engw);
hold on;
plot(F,russ);
hold on;
plot(F,rusw);
xlabel('Frequency(Hz)');
ylabel('Coherence(z-score)');
legend('english strong','english weak','russian strong','russian weak');


engs_theta=Cpow_engs_sentavg(7:13,:);
es_theta=mean(engs_theta,1);
engs_gamma=Cpow_engs_sentavg(35:50,:);
es_gamma=mean(engs_gamma,1);

engw_theta=Cpow_engw_sentavg(7:13,:);
ew_theta=mean(engw_theta,1);
engw_gamma=Cpow_engw_sentavg(35:50,:);
ew_gamma=mean(engw_gamma,1);

russ_theta=Cpow_russ_sentavg(7:13,:);
rs_theta=mean(russ_theta,1);
russ_gamma=Cpow_engw_sentavg(35:50,:);
rs_gamma=mean(russ_gamma,1);

rusw_theta=Cpow_rusw_sentavg(7:13,:);
rw_theta=mean(rusw_theta,1);
rusw_gamma=Cpow_rusw_sentavg(35:50,:);
rw_gamma=mean(rusw_gamma,1);


es_theta=es_theta';
es_gamma=es_gamma';
ew_theta=ew_theta';
ew_gamma=ew_gamma';
rs_theta=rs_theta';
rs_gamma=rs_gamma';
rw_theta=rw_theta';
rw_gamma=rw_gamma';
