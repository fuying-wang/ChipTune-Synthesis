close all;clear all;clc;
[y,FS]=audioread('audioTest.wav');
x=y(1:5000);
x=mapminmax(x,0,1);
[a,b]=xcorr(x,'unbiased');
[peaks,locs]=findpeaks(a,'minpeakdistance',200,'minpeakheight',0.1);
[c,d]=sort(peaks,'descend');
idx=locs(d);
start_time=abs(idx(2)-idx(1))/FS;
save('start_time.mat','start_time');