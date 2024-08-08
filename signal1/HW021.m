fs = 1000; %取樣頻率1000Hz
t = (0:1/fs:1)'; %測量時間為1秒，從0開始，每1/fs秒取一次，直到1秒
N = length(t); %取樣次數
y = sin(2*pi*50*t); %產生正弦波
yn = randn(N,1)+y;
sn = randn(N,1); %產生白雜訊
yy = yn+sn;

function drawpic(position,t, data, title_text, x_label_text, y_label_text)
    subplot(5, 1, position);
    plot(t, data);
    title(title_text);
    xlabel(x_label_text);
    ylabel(y_label_text);
end

figure(1)
drawpic(1,t, yn, 'Signals(yn)', 'Time(sec)', 'Amplitude');
drawpic(2,t, yy, 'Signals with noise(yn+sn)', 'Time(sec)', 'Amplitude');

%過零率
zeroCrossings = sum(yy(1:end-1) .* yy(2:end) < 0);
disp(['zeroCrossings：', num2str(zeroCrossings)]);

%震幅
amplitude = max(abs(yy));
disp(['amplitude：', num2str(amplitude)]);

%峰值
peakValue = max(yy);
disp(['PeakValue：', num2str(peakValue)]);

%能量
energy = sum(yy.^2)/length(yy);
disp(['Energy：', num2str(energy)]);

%圖形標記
text(0.9,-10, ['zeroCrossings: ', num2str(zeroCrossings)]);
text(0.9,-12, ['amplitude: ', num2str(amplitude)]);
text(0.9,-14, ['peakValue: ', num2str(peakValue)]);
text(0.9,-16, ['energy: ', num2str(energy)]);


