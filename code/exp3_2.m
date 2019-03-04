close all;clear all;clc;
[y,FS]=audioread('audioTest.wav');
x=y(1:5000);
[S,F,T,P]=spectrogram(x,512,64,8096,FS);
surf(T,F,10*log10(P),'edgecolor','none'); axis tight;
view(0,90);
xlabel('Time (Seconds)'); ylabel('Hz');
title('audioTest前5000个采样点 STFT')