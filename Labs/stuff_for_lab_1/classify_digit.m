function label = classify_digit(digit_image, digits_training)

    digits_training = prepare_digits(digits_training);
    
    center = [20,20];
    r = 6;
    desc = gradient_descriptor(digit_image, center, r);
    
    len = length(digits_training);
    dist = zeros(1,len);
    
    for i=1:len
        dist(i) = norm(desc - digits_training(i).descriptor);
    end
    
    [~,I] = min(dist);
    
    label = digits_training(I).label;
    
end