function desc = gradient_descriptor(image, position, radius) 

    std = radius/10;
    [grad_x, grad_y] = gaussian_gradients(image, std);
    centres = place_regions(position, radius)

    
    
    
end
