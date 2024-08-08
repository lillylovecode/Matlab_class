##HW:寫一個Sobel測邊，測Lena，門檻值設125，用for loop

% Load the Lena image
lena = imread('lena_std.tif');

% 轉換成灰度圖片
lena_gray = rgb2gray(lena);

% 取得圖片尺寸
[rows, cols] = size(lena_gray);

% 初始化 Sobel 運算子
sobel_filter_x = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobel_filter_y = sobel_filter_x';

% 初始化結果矩陣
sobel_result = zeros(rows, cols);

% 使用 Sobel 運算子計算邊緣
for i = 2:rows-1
    for j = 2:cols-1
        % 在圖像內部區域應用 Sobel 運算子
        Gx = sum(sum(double(lena_gray(i-1:i+1, j-1:j+1)) .* sobel_filter_x));
        Gy = sum(sum(double(lena_gray(i-1:i+1, j-1:j+1)) .* sobel_filter_y));

        % 計算邊緣強度
        sobel_result(i, j) = sqrt(Gx^2 + Gy^2);
    end
end

% 將邊緣強度超過門檻值的像素設置為白色，其他設置為黑色
threshold = 125;
sobel_result(sobel_result <= threshold) = 0;
sobel_result(sobel_result > threshold) = 255;

% 顯示結果
subplot(211);
imshow(lena);
title('Lena')
subplot(212);
imshow(uint8(sobel_result));
title('Sobel result');


