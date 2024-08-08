N=10;%N=10,30,50,100,200

x=[];

for i=1:N
  x1=randn(1,100); %產生100點的高斯隨機訊號樣本，平均值=0
  x=[x;x1];
end

aver=mean(x); %求N個樣本的平均

plot(aver)

