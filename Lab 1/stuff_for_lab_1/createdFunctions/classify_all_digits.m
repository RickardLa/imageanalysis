%% classify_all_digits
clc
clf
clear
close all

load digits.mat;
correct = 0; 

% Go thorugh all validation-images. Classify images and count # of correct
% classifications

for i=1:length(digits_validation)
    img = digits_validation(i).image;
    label = classify_digit(img, digits_training);
    
    if label == digits_validation(i).label
        correct = correct + 1; 
    end
    
    
end

successRate = correct/length(digits_validation)*100      % Correct answers in %