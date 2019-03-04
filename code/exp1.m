close all;clear all;clc;
fs=8000;T=0.3;D=[1/8,3/8,4/8];
t=linspace(0,1,fs);
y1=double(square(2*pi*t/T,D(1)*100)>0);
y2=double(square(2*pi*t/T,D(2)*100)>0);
y3=double(square(2*pi*t/T,D(3)*100)>0);
y4=sawtooth(2*pi*t/T,1);
y5=sawtooth(2*pi*t/T,0.5);
N=20;
y6=double(rand(1,fs/N)>0.5);
y6=double(resample(y6,N,1)>0.5);
subplot(311)
plot(t,y1);
xlabel('t(second)')
title('矩形波 占空比：1/8')
subplot(312)
plot(t,y2);
xlabel('t(second)')
title('矩形波 占空比：3/8')
subplot(313)
plot(t,y3);
xlabel('t(second)')
title('矩形波 占空比：4/8')
figure;plot(t,y4);
xlabel('t(second)')
title('锯齿波')

figure;plot(t,y5);
xlabel('t(second)')
title('三角波')

figure;plot(t,y6);
xlabel('t(second)')
title('伪随机噪声')
