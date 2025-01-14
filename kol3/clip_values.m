function result = clip_values(input)
    result = max(min(input, 255), 0);
end
