close all;clear all;clc;
[y,FS]=audioread('audio.wav');
y=y(:,1);
%y=y(:,2);
wp=[150 2000]/4000;
ws=[100 2500]/4000;
Rp=3; Rs=40;
[n,wn]=buttord(wp,ws,Rp,Rs);
[B,A]=butter(n,wn);
y=filter(B,A,y);
y1=diff(diff(y));
len=length(y1);
z=zeros(len,1);
step=40;
for m=1:len
  z(m)=max(y1(max(1,m-step):min(len,m+step)));
end
z=medfilt1(z,40);
findpeaks(z,'minpeakdistance',10000);
xlabel('采样点');
ylabel('信号幅度')
[peaks,locs]=findpeaks(z,'minpeakdistance',10000);
note_time=diff(locs);
mean(note_time(15:75))/FS


