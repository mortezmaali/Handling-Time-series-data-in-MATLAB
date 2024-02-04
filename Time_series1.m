%Just run this program and select your file
clc
clear

[file,path] = uigetfile('*.xlsx');

T = readtable([path '/' file]);

%these are the figures that present the data

figure(1);plot(T.Timestamp,T.WindFarmTotal_WindFarm_kW_)
figure(2);plot(T.Timestamp_1,T.WindFarmTotal_WindFarm_kW__1)
figure(3);plot(T.Timestamp_2,T.WindFarmTotal_WindFarm_kW__2)