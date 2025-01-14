function gray_signal = convert_to_gray(signal)
    % Funkcja konwertująca obraz na odcienie szarości za pomocą średniej
    if ndims(signal) == 3
        gray_signal = mean(signal, 3); % Średnia z kanałów R, G, B
    else
        gray_signal = signal; % Obraz jest już w skali szarości
    end
end

