function resized_image = resize_nearest_neighbor(image, new_width, new_height)

    [old_height, old_width, num_channels] = size(image);

    scale_x = old_width / new_width;
    scale_y = old_height / new_height;

    resized_image = zeros(new_height, new_width, num_channels, class(image));

    for y = 1:new_height
        for x = 1:new_width
            old_x = round((x - 0.5) * scale_x + 0.5);
            old_y = round((y - 0.5) * scale_y + 0.5);

            old_x = min(max(old_x, 1), old_width);
            old_y = min(max(old_y, 1), old_height);

            resized_image(y, x, :) = image(old_y, old_x, :);
        end
    end
end

