function [grad_x, grad_y] = gaussian_gradients(img, std)

img = gaussian_filter(img,std); 
[grad_x, grad_y] = gradient(img); 
end
