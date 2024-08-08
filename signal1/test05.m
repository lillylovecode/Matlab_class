N = input('Type in the length of the sequence = ');
M = input('Type in the length of the DFT = ');
u = [ones(1,N)]; %unit step sequency
U = fft(u,M);
U_mag = abs(U);
U_ang = angle(U);
k = 0:1:M-1;
t = 0:1:N-1;

%Plot
figure
subplot(221)
stem(t,u)
xlabel('Time index n')
ylabel('Amplitude')
subplot(222)
stem(k,U_mag)
xlabel('Frequency index k')
ylabel('Magnitude')
subplot(223)
stem(k,U_ang)
xlabel('Frequency index k')
ylabel('Phase')
