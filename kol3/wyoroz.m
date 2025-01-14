signal = double(imread('rzeczka.jpg'));

if ndims(signal) == 3
    [m, n, c] = size(signal);
else
    [m, n] = size(signal);
    c = 1;
end

mask = [5/50, 6/50, 5/50;
        6/50, 6/50, 6/50;
        5/50, 6/50, 5/50];

[mask_m, mask_n] = size(mask);
assert(mask_m == 3 && mask_n == 3, 'Maska musi mieć wymiary 3x3');

filtered_signal = zeros(size(signal));

for ch = 1:c
    if c > 1
        padded_signal = padarray(signal(:, :, ch), [1, 1], 'replicate', 'both');
    else
        padded_signal = padarray(signal, [1, 1], 'replicate', 'both');
    end

    for i = 1:m
        for j = 1:n
            region = padded_signal(i:i+2, j:j+2);
            filtered_signal(i, j, ch) = sum(sum(region .* mask));
        end
    end
end

filtered_signal = clip_values(filtered_signal);


subplot(1, 2, 1);
imshow(signal/255);
title('Oryginalny obraz');

subplot(1, 2, 2);
imshow(filtered_signal/255);
title('Wyostrzony obraz');

