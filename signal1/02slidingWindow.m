fs = 1000; %取樣頻率1000Hz
t = (0:1/fs:1)'; %測量時間為1秒，從0開始，每1/fs秒取一次，直到1秒
N = length(t); %取樣次數
y = sin(2*pi*50*t); %產生正弦波
yn = randn(N,1)+y;

M=3;
yy=[];
for i=1:1:N-M+1 % sliding window
  yy1=yn(i:i+M-1);
  yy2=mean(yy1);
  yy=[yy yy2];
end
yy3=yy;

M=5;
yy=[];
for i=1:1:N-M+1 % sliding window
  yy1=yn(i:i+M-1);
  yy2=mean(yy1);
  yy=[yy yy2];
end
yy5=yy;

M=7;
yy=[];
for i=1:1:N-M+1 % sliding window
  yy1=yn(i:i+M-1);
  yy2=mean(yy1);
  yy=[yy yy2];
end
yy7=yy;


%畫圖
figure(1)
subplot(311)
plot(yy3)
title('M=3')
xlabel('Time(sec)')
ylabel('Amplitude')

subplot(312)
plot(yy5)
title('M=5')
xlabel('Time(sec)')
ylabel('Amplitude')

subplot(313)
plot(yy7)
title('M=7')
xlabel('Time(sec)')
ylabel('Amplitude')
