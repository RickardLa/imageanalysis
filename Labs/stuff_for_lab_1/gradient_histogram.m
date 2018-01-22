function histogram = gradient_histogram(grad_x,grad_y)
bin_length = 8; 
bin_size = pi/bin_length;               
histogram = zeros(1,bin_length); 

theta= atan2(grad_y,grad_x);            % Angles in [-pi, pi]
theta(theta<0) = theta(theta<0) + pi;   % Making all angles positive

magnitude = sqrt(grad_x.^2+grad_y.^2); 










end