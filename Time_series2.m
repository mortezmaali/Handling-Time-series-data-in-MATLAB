
%Just run this program and select your file and then you'll be fine
clc
clear

[file,path] = uigetfile('*.xlsx');

T = readtable([path '/' file]);

%these are the figures that present the data

figure(1);plot(T.Timestamp,T.WindFarmTotal_WindFarm_kW_)
figure(2);plot(T.Timestamp_1,T.WindFarmTotal_WindFarm_kW__1)
figure(3);plot(T.Timestamp_2,T.WindFarmTotal_WindFarm_kW__2)
%Now I am computing the mean values for each set of data monthly and come
%up with 60 values for each of the three different sets of data
ss = string(T.Timestamp);
k=1;
su_t = zeros(1,1);
for i = 1:60
    B = convertStringsToChars(ss(k));
    con = B(4:6);
    su = 0;
    f = 0;
    Ti(i) = T.Timestamp(k);
    while contains( B,con) && k < 43647
        su = su + T.WindFarmTotal_WindFarm_kW_(k);
        k = k + 1;
        B = convertStringsToChars(ss(k));
        f = f+1;
    end
    su_t(i) = su / f;
end
figure(4);plot(Ti,su_t,'r'); hold on;

ss = string(T.Timestamp_1);
k=1;
su_t2 = zeros(1,1);
for i = 1:60
    B = convertStringsToChars(ss(k));
    con = B(4:6);
    su = 0;
    f = 0;
    while contains( B,con) && k < 43647
        su = su + T.WindFarmTotal_WindFarm_kW__1(k);
        k = k + 1;
        B = convertStringsToChars(ss(k));
        f = f+1;
    end
    su_t2(i) = su / f;
end
figure(4);plot(Ti,su_t2,'b');hold on;

ss = string(T.Timestamp_2);
k=1;
su_t3 = zeros(1,1);
for i = 1:60
    B = convertStringsToChars(ss(k));
    con = B(4:6);
    su = 0;
    f = 0;
    while contains( B,con) && k < 43647
        su = su + T.WindFarmTotal_WindFarm_kW__2(k);
        k = k + 1;
        B = convertStringsToChars(ss(k));
        f = f+1;
    end
    su_t3(i) = su / f;
end
figure(4);plot(Ti,su_t3,'g');
legend('10MW','12MW','15MW')
   