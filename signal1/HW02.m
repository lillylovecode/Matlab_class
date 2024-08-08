fs = 1000; %取樣頻率1000Hz
t = (0:1/fs:1)'; %測量時間為1秒，從0開始，每1/fs秒取一次，直到1秒
N = length(t); %取樣次數
y = sin(2*pi*50*t); %產生正弦波
yn = randn(N,1)+y;

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

%過零率
zeroCrossings = sum(yn(1:end-1) .* yn(2:end) < 0);
disp(['zeroCrossings：', num2str(zeroCrossings)]);

%震幅
amplitude = max(abs(yn));
disp(['amplitude：', num2str(amplitude)]);

%峰值
peakValue = max(yn);
disp(['PeakValue：', num2str(peakValue)]);

%能量
energy = sum(yn.^2)/length(yn);
disp(['Energy：', num2str(energy)]);

%圖形標記
text(0.9,-5, ['peakValue: ', num2str(peakValue)]);
text(0.9,-6, ['amplitude: ', num2str(amplitude)]);
text(0.9,-7, ['zeroCrossings: ', num2str(zeroCrossings)]);
text(0.9,-8, ['energy: ', num2str(energy)]);


