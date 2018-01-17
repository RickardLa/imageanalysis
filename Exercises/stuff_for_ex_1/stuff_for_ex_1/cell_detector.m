function centres = cell_detector(img)

    load linearClassifier.mat;
%     threshold = 0.01; 
    
    result = imfilter(img,w);                           % Filter with linear classifier
%     result(result >= threshold) = 1; 
    centres = strict_local_maxima(result); 
    

end
