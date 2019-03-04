close all;clear all;clc;
load('sheetCz.mat');
fs=8000;T=0.3;D=3/8;notetime=0.25;
t=0:1/fs:notetime-1/fs;
x=double(square(2*pi*sheetCz(1,1)*t,D*100)>0)+sawtooth(2*pi*sheetCz(2,1)*t);
for n=2:size(sheetCz,2)
    temp=double(square(2*pi*sheetCz(1,n)*t,D*100)>0)+sawtooth(2*pi*sheetCz(2,n)*t,0.5);
    x=cat(2,x,temp);
end
x=mapminmax(x, 0, 1);
sound(x(1:8000*10),fs,8);
audiowrite('Cz.wav',x,fs);