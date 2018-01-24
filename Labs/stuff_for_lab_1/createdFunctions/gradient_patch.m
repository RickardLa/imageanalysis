function [patch_x, patch_y] = gradient_patch(grad_x,grad_y,center,radius)
    
    bottomX = center(1)-radius;
    topX = center(1)+radius;
    bottomY = center(2)-radius;
    topY = center(2)+radius;
    
    patch_x = grad_x(bottomX:topX , bottomX:topX);
    patch_y = grad_y(bottomY:topY , bottomY:topY); 
end