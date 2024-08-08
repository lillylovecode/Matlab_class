pkg load signal;
ecg=load('ECG.txt');
x1=ecg';%(200);
x2=[zeros(1,100),x1];                %延遲100點的ECG訊號
figure
subplot(211)
plot(x1)
subplot(212)
plot(x2)

r=xcorr(x2,x1);                     %計算交互相關係數
r=r./max(r);                        %係數正規化
rxy=r((length(r)+1)/2:length(r));   %觀察N:N-1之相關係數
n= find(rxy==max(rxy));             %找出最大相關係數的位置
lag= n-1                            %計算延遲(Lag)
