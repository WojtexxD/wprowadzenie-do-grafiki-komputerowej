signal = double(imread('rzeczka.jpg'));

if ndims(signal) ~= 3
    error('Obraz musi być kolorowy (RGB).');
end

mask = [-1, -2, -1;
         0,  0,  0;
         1,  2,  1];

[m, n, c] = size(signal);

filtered_signal = zeros(m, n, c);

padded_signal = padarray(signal(:, :, ch), [1, 1], 'replicate', 'both');

for ch = 1:c
    for i = 1:m
        for j = 1:n
            region = padded_signal(i:i+2, j:j+2);
            filtered_signal(i, j, ch) = sum(sum(region .* mask));
        end
    end
end

result_signal = sqrt(sum(filtered_signal .^ 2, 3));

min_val = min(result_signal(:));
max_val = max(result_signal(:));
if max_val > min_val
    result_signal = (result_signal - min_val) / (max_val - min_val) * 255;
else
    result_signal = zeros(size(result_signal));
end

subplot(1, 2, 1);
imshow(signal/255);
title('Oryginalny obraz');

subplot(1, 2, 2);
imshow(result_signal/255);
title('Krawędzie w pionie (Sobel)');

