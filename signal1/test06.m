fs = 1000; %取樣頻率1000Hz
t = (0:1/fs:1)'; %測量時間為1秒，從0開始，每1/fs秒取一次，直到1秒
N = length(t); %取樣次數
y = sin(2*pi*50*t)+sin(2*pi*120*t); %產生正弦波

randn('state',0)
yn=y+randn(size(y));

y_fft = fft(y);
yn_uuf= fft(yn);
T=1/fs;
fd=1/(N*T);
m = 0:N-1; %m索引
fy=m.*fd;
fyn = m.*fd;

function drawpic(position,t, data, title_text, x_label_text, y_label_text)
    subplot(5, 1, position);
    plot(t, data);
    title(title_text);
    xlabel(x_label_text);
    ylabel(y_label_text);
end


figure(1)
drawpic(1,t, y, 'Signals(y)', 'Time(sec)', 'Amplitude');
drawpic(2,t, yn, 'Signals with noise(yn)', 'Time(sec)', 'Amplitude');

figure(2)
drawpic(1,t, y, 'Signals(y)', 'Time(sec)', 'Amplitude');
drawpic(2,t, yn, 'Signals with noise(yn)', 'Time(sec)', 'Amplitude');

