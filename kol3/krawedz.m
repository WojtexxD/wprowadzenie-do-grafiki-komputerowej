signal = double(imread('rzeczka.jpg'));

gray_signal = convert_to_gray(signal);

mask = [0,  0,  0;
       -1,  0,  1;
        0,  0,  0];

[m, n] = size(gray_signal);

padded_signal = padarray(gray_signal, [1, 1], 'replicate', 'both');

filtered_signal = zeros(m, n);

for i = 1:m
    for j = 1:n
        region = padded_signal(i:i+2, j:j+2);
        filtered_signal(i, j) = sum(sum(region .* mask));
    end
end

result_signal = abs(filtered_signal);

result_signal = (result_signal - min(result_signal(:))) / (max(result_signal(:)) - min(result_signal(:))) * 255;

subplot(1, 3, 1);
imshow(gray_signal/255);
title('Odcienie szarości');

subplot(1, 3, 2);
imshow(filtered_signal/255);
title('Wykrywanie krawędzi (poziome)');

subplot(1, 3, 3);
imshow(result_signal/255);
title('Moduł wykrytych krawędzi');

