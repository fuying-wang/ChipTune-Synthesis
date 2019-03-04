close all;clear all;clc;
[y,FS]=audioread('audioTest.wav');
load('whichSheet6.mat');
load('start_time.mat')
y=mapminmax(y,0,1);
lev=4;
tNote=0.1575;
yd=wden(y,'heursure','s','mln',lev,'haar');
cor=zeros(6,96);
idx=round(start_time*FS:tNote*FS:start_time*FS+tNote*FS*96);
 for k=1:6
    base=eval(['base1',num2str(k)]);
    for m=1:96
        y1=yd(idx(m):idx(m+1));
        t=0:1/FS:length(y1)/FS-1/FS;
        temp=sin(2*pi*base(m)*t);
        s=corrcoef(y1,temp);
        cor(k,m)=abs(s(1,2));
    end
end
cor(isnan(cor)) = 0;
[a,b]=sort(cor,1,'descend'); %column dimension
tabulate(b(1,:))



% m=1;
% y1=yd(idx(1):idx(2));
% y1_fft=abs(fft(yd(idx(1):idx(2))));
% f=[1:length(y1_fft)].*FS/length(y1_fft);
% plot(f,y1_fft)
% xlabel('f/Hz');
% title('µÚ1¸öÒô·ûÆ¬¶ÎµÄFFT');