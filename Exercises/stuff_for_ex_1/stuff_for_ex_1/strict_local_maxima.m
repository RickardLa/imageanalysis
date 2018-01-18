function maxima = strict_local_maxima(image)

    max = ordfilt2(image, 9, ones(3,3));
    indicator = (image==max);
    [row, col] = find(indicator);
    maxima = [col row]';
    
end