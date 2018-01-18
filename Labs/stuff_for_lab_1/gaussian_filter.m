function result = gaussian_filter(img,std)
    
    h = fspecial('gaussian',floor(4*std),std);
    result = imfilter(img,h,'symmetric');

end
