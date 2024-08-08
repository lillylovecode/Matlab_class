#========================變數宣告==============================#

fs = 1000; %取樣頻率1000Hz
t = (0:1/fs:1)'; %測量時間為1秒，從0開始，每1/fs秒取一次，直到1秒
N = length(t); %取樣次數
y = sin(2*pi*50*t); %產生正弦波
yn = 0.5*randn(size(y))+y;
sn = 0.1*randn(size(y));%白雜訊 sn
yy = [sn(1:500);yn(1:501)]; %串聯sn與yn

#========================自訂函式===============================#
%%繪圖函式
function drawpic(position,data, t,title_text, x_label, y_label)
    subplot(4, 1, position);
    if t == 0
      plot(data)
    else
      plot(t,data);
    endif
    title(title_text);
    xlabel(x_label);
    ylabel(y_label);
end
%%平滑函式
function MA=smoothed(y, number)
N=length(y);
yy = [];
  for i = 1:1:N-number+1
    yy1 = y(i:i+number-1);
    yy2 = mean(yy1);
    yy = [yy yy2];
  end
MA = yy;
end
#========================程式邏輯===============================#
%先將原本訊號平滑化
yy_smoothed = smoothed(yy, 5);
N=length(yy_smoothed);
M = 20; %window size

% 計算振幅
yy = [];
for i = 1:1:N-M+1
  yy1 = yy_smoothed(i:i+M-1);
  yy2 = sum(abs(yy1));
  yy = [yy yy2];
end
amplitude = yy;

% 計算能量
yy = [];
for i = 1:1:N-M+1
  yy1 = yy_smoothed(i:i+M-1);
  yy2 = sum(yy1.^2);
  yy = [yy yy2];
end
energy = yy;

% 計算過零率
yy = [];
for i = 1:1:N-M+1
  yy1 = yy_smoothed(i:i+M-1);
  count = 0;
  for j = 1:1:M-1
    if yy1(j)*yy1(j+1)<0;
      count = count + 1;
    endif
  endfor
  yy = [yy count];
end
zero_crossing = yy;

% 試算訊號斷點
yy = [];
for i = 1:1:length(zero_crossing)
  yy1 = energy(i)/zero_crossing(i);
  yy=[yy, yy1];
endfor
stop_point = yy;

%畫圖
drawpic(1, yn, t,'signals', 'Time(sec)', 'Amplitude');
#drawpic(2, yy, t,'signals(yn->sn)', 'Time(sec)', 'Amplitude');
drawpic(2, yy_smoothed, 0,'signals smoothed', 'Time(sec)', 'Amplitude');
drawpic(3, energy, 0,'energy', 'Time(sec)', 'Amplitude');
drawpic(4, zero_crossing,0,'ZeroCrossing', 'Time(sec)', 'Amplitude');
#drawpic(4, amplitude, 0,'amplitude', 'Time(sec)', 'Amplitude');
#drawpic(5, stop_point, 0,'stop_point', 'Time(sec)', 'Amplitude');


