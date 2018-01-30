function label = classify_digit(digit_image, digits_training)
    digits_training = prepare_digits(digits_training);     % Compute descriptors for all training images     
    
    center = [20,20];
    r = 6;                                                 % This combination of center and radius gave best result  
    desc = gradient_descriptor(digit_image, center, r);    % Compute descriptor for given validation image
    
    len = length(digits_training);
    dist = zeros(1,len);
    
    % Distance between DESC of validation image and DESC of training images
    for i=1:len
        dist(i) = norm(desc - digits_training(i).descriptor);
    end
    
    [~,I] = min(dist);              % Save index minimum distance
    
    label = digits_training(I).label;
    
end