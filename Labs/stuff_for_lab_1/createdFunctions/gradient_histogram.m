function histogram = gradient_histogram(grad_x,grad_y)
bin_length = 8;                           % Divide into 8 bins with equal size, pi/4
histogram = zeros(1,bin_length);

theta = atan2(grad_y,grad_x);             % Compute direction of all gradients, [-pi, pi]
theta(theta<0) = theta(theta<0) + 2*pi;   % Making all angles positive, [0, 2*pi]

magnitude = sqrt(grad_x.^2+grad_y.^2);    % Compute magnitude of all gradients



% Go through entire image. Place gradient in corresponding bin and sum
% magnitudes. Result saved in histogram which is a vector of length 8.


for i=1:size(grad_x,1)*size(grad_x,2)       
    if theta(i)>= 0 && theta(i)<pi/4
        histogram(1) = histogram(1) + magnitude(i);
    elseif theta(i)>= pi/4 && theta(i)<pi/2
        histogram(2) = histogram(2) + magnitude(i);
    elseif theta(i)>= pi/2 && theta(i)<3*pi/4
        histogram(3) = histogram(3) + magnitude(i);
    elseif theta(i)>= 3*pi/4 && theta(i)<pi
        histogram(4) = histogram(4) + magnitude(i);
    elseif theta(i)>= pi && theta(i)<5*pi/4
        histogram(5) = histogram(5) + magnitude(i);
    elseif theta(i)>= 5*pi/4 && theta(i)<6*pi/4
        histogram(6) = histogram(6) + magnitude(i);
    elseif theta(i)>= 6*pi/4 && theta(i)<7*pi/4
        histogram(7) = histogram(7) + magnitude(i);
    else
        histogram(8) = histogram(8) + magnitude(i);
    end
    
end





end