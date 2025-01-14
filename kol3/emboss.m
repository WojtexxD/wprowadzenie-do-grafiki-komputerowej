signal = double(imread('rzeczka.jpg'));

if ndims(signal) == 3
    gray_signal = mean(signal, 3); % Średnia z kanałów R, G, B
else
    gray_signal = signal; % Obraz jest już w skali szarości
end

mask = [-1, -1, 0;
        -1,  0,  1;
         0,  1,  1];

[m, n] = size(gray_signal);

padded_signal = padarray(gray_signal, [1, 1], 'replicate', 'both');

filtered_signal = zeros(m, n);

for i = 1:m
    for j = 1:n
        region = padded_signal(i:i+2, j:j+2);
        filtered_signal(i, j) = sum(sum(region .* mask));
    end
end

result_signal = filtered_signal + 127.5;

result_signal = max(0, min(255, result_signal));

subplot(1, 2, 1);
imshow(gray_signal/255);
title('Odcienie szarości');

subplot(1, 2, 2);
imshow(result_signal/255);
title('Efekt Emboss');

