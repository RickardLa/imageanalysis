function desc = gradient_descriptor(image, position, radius)

    [grad_x, grad_y] = gaussian_gradients(image,radius/10);
    regions = place_regions(position, radius);

    desc = zeros(9,8);

    for i=1:9
       center(1) = regions(1,i);
       center(2) = regions(2,i);
       [patch_x, patch_y] = gradient_patch(grad_x,grad_y,center,radius);
       desc(i,:) = gradient_histogram(patch_x,patch_y);
    end

    desc = desc(:)/norm(desc(:),1);
end