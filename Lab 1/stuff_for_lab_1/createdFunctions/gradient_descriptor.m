function desc = gradient_descriptor(image, position, radius)

    [grad_x, grad_y] = gaussian_gradients(image,radius/4);                   % Compute gradients for entire image. std is proportional to radius
    regions = place_regions(position, radius);                                % Place 3x3-grid at given position


    desc = zeros(9,8);                                                        % 9 regions, 8 bins in histogram
    for i=1:9
       center(1) = regions(1,i);                                              % Index for columns
       center(2) = regions(2,i);                                              % Index for  rows
       
       patch_x = get_patch(grad_x, center(1), center(2), radius);             % Extract gradients that reside in given region
       patch_y = get_patch(grad_y, center(1), center(2), radius);
       
       desc(i,:) = gradient_histogram(patch_x,patch_y);                       % Compute histogram for given region. Stored row-wise.
    end

    desc = desc(:)/norm(desc);                                           % Convert to vector normalize descriptors. desc is 72 long vector (9 regions * 8 bins = 72)





end