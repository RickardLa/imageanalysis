function centres = cell_detector(img)
    
    load linearClassifier.mat;
    result = imfilter(img,w);                           % Filter with linear classifier
    centres = strict_local_maxima(result); 
    

end
