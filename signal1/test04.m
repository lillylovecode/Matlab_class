fs = 1000; %取樣頻率1000Hz
t = (0:1/fs:1)'; %測量時間為1秒，從0開始，每1/fs秒取一次，直到1秒
N = length(t); %取樣次數

y = load('ECG.txt');
randn('state',0) %設定隨機產生符合常態分佈的隨機數(平均值為0)
yn = y + randn(size(y));
yy = [yn;yn;yn;yn;yn;yn;yn;yn;yn;yn];

sn = 0.3*randn(N,1); %產生白雜訊
yyy = [sn;yn];

function drawpic(position,data, title_text, x_label_text, y_label_text)
    subplot(5, 1, position);
    plot(data);
    title(title_text);
    xlabel(x_label_text);
    ylabel(y_label_text);
end

drawpic(1, yy, 'ECG signals', 'Time(sec)', 'Amplitude');
drawpic(2, yyy, 'ECG with noise', 'Time(sec)', 'Amplitude');

