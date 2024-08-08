% Step 1: Basic Setup
fs = 1000;             % Sampling frequency of 1000 Hz
t = (0:1/fs:1)';       % Measurement time is 1 second, starting from 0, sampled every 1/fs seconds until 1 second
N = length(t);         % Number of samples

% Generate a sine wave signal
f = 50;                % Sine wave frequency of 50 Hz
y = sin(2 * pi * f * t); % Generate a sine wave

% Step 2: Add an outlier
% Add an outlier at a specific position in the signal
y(500) = 2;

% Step 3: Median Filtering
M = 7;  % Window size
p = (M - 1) / 2;  % Number of points to pad before and after

% Copy and pad the boundaries
y_padded = [repmat(y(1), p, 1); y; repmat(y(end), p, 1)];

% Define a new signal to store the median-filtered result
filtered_y = y;

% Iterate through each element of y
for i = (1 + p):(length(y) + p)
    % Extract a window from y_padded
    window = y_padded(i - p:i + p);
    % Calculate the median within the window
    median_value = median(window);
    % Assign the median value to the corresponding position in filtered_y
    filtered_y(i - p) = median_value;
end

% Step 4: Plot the original signal and the signal after median filtering
figure;
subplot(2, 1, 1);
plot(t, y);
title('Original Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2, 1, 2);
plot(t, filtered_y);
title('Signal after Median Filtering');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

