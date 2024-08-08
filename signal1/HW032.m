clear all;
pkg load signal;
ecg=load('ECG.txt');
x=ecg;% template
y=[x;x;x;x;x;x;x;x;x;x;x]; %11 ECG signal
N=length(y);
yn=0.1*randn(N,1)+y; % ECG signal with noise
rxy=xcorr(yn,x); % cross-correlation
rxy=rxy(N:(2*N-1))/max(rxy);

L=[];
for i=1:200:length(rxy)
  rxyl=rxy(i:i+195);
  L1=find(rxyl==max(rxyl));
  L=[L;L1+i];
end

%計算QRS波數量
yy=[];
QRS_threshold = 0.8
QRS_threshold2 = 0.85
count = 0;
for i = 1:length(rxy)
  if rxy(i)>=QRS_threshold && rxy(i)<=QRS_threshold2
    count = count+1;
  endif
end
num = count/2;
disp(['QRS波數量=',num2str(num)]);


%做50次樣本平均
necg=[];
for k = 1:50
  aver = zeros(1,196);
  for j=1:length(L)
    if L(j)<=N
      necg1 = yn(L(j):(L(j)+195));
      aver  = aver + necg1;
      necg = [necg necg1];
    endif
  endfor
end

%Plot
figure
subplot(221)
plot(x)
subplot(222)
plot(yn)
subplot(212)
plot(rxy)
figure
subplot(211)
plot(necg1(:,1))
subplot(212)
plot(aver(:,1))
