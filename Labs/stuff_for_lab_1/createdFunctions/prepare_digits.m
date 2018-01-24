function digits_training = prepare_digits(digits_training)

    center = [20, 20];
    r = 6;
    
    for i=1:length(digits_training)
        img = digits_training(i).image;
        digits_training(i).descriptor = gradient_descriptor(img,center,r);
    end

end
