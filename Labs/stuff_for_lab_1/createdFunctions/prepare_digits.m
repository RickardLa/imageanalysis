function digits_training = prepare_digits(digits_training)

    center = [20, 20];      % Training images are 39x39
    r = 6;                  % 3x3 grid. Total length = 2*radius*3 regions = 36 
                            % --> Fits in training images
    
    % Compute descriptors for all 100 training images. 
    for i=1:length(digits_training)
        img = digits_training(i).image;
        digits_training(i).descriptor = gradient_descriptor(img,center,r);
    end

end
