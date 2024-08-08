%步驟一:基本設定
fs = 1000; %取樣頻率1000Hz
t = (0:1/fs:1)'; %測量時間為1秒，從0開始，每1/fs秒取一次，直到1秒
N = length(t); %取樣次數
y = sin(2*pi*50*t); %產生正弦波

%步驟二:加入雜訊產生yn
randn('state',0) %設定隨機產生符合常態分佈的隨機數(平均值為0)
yn = y + randn(size(y));

%步驟三:加入異常值
idx = 500;
spk = yn(idx)*6;
yn(idx) = spk;


%步驟四:使用中值濾波移除異常值(這裡設定超過5倍標準差)
yn_median = yn
for i = 2:(N - 1)
    if (yn_median(i) > 5 * std(yn)) || (yn_median(i) < -5 * std(yn))
        yn_median(i) = (yn_median(i + 1) + yn_median(i - 1)) / 2;
    end
end


%步驟五:去除趨勢detrend
y_detrend = detrend(yn_median);

%步驟六:移動平均去除噪聲noise
M = 3; %時序軸長度，通常為奇數
y_filtered = movmean(y_detrend,M);

%畫圖
figure(1)
subplot(511)
plot(t,y)
title('Signals(y)')
xlabel('Time(sec)')
ylabel('Amplitude')

subplot(512)
plot(t,yn)
title('Signals with noise(yn)')
xlabel('Time(sec)')
ylabel('Amplitude')

subplot(513)
plot(t,yn_median)
title('Signals with noise after median filter(yn median)')
xlabel('Time(sec)')
ylabel('Amplitude')

subplot(514)
plot(t,y_detrend)
title('Signals detrend(y detrend)')
xlabel('Time(sec)')
ylabel('Amplitude')

subplot(515)
plot(t,y_filtered)
title('Signals filtered(y filtered)')
xlabel('Time(sec)')
ylabel('Amplitude')

