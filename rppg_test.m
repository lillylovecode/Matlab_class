pkg load signal;
yn = load('./b_channel_signal_2023121113.txt');

yn_median = medfilt1(yn);

y_detrend = detrend(yn_median);


figure
subplot(311);
plot(yn);
subplot(312);
plot(y_median);
subplot(313);
plot(y_detrend);
