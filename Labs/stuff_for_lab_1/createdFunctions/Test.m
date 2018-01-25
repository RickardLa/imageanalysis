% Testing

%% get_patch
clc
clf
clear 
close all

% img = read_as_grayscale('church_test/church1.jpg');
img = read_image('church_test/church1.jpg');
imagesc(img)
figure

patch = get_patch(img, 400,300, 200);


imagesc(patch)


%% gaussian_filter
clc
clf
clear 
close all


std = 3; 
img = read_as_grayscale('church_test/church1.jpg');
imgFiltered = gaussian_filter(img,std); 
imagesc(imgFiltered), colormap gray

%% gaussian_gradients
clc
clf
clear 
close all

std = 3;
img = read_as_grayscale('church_test/church1.jpg');
[grad_x, grad_y] = gaussian_gradients(img, std);

imagesc(img), colormap gray
axis image
hold on
quiver(grad_x, grad_y)


%% gradient_histogram
clc
clf
clear 
close all

std = 3;
img = read_as_grayscale('church_test/church2.jpg');

[grad_x, grad_y] = gaussian_gradients(img, std);
% histogram = gradient_histogram(grad_x,grad_y)
plot_bouquet(img,3)

%% place_regions
clc
clf
clear 
close all


img = read_image('paper_with_digits.png');
 
radius = 200;
centres = place_regions([816; 612], radius);

plot_squares(img, centres, radius)

%% gradient_descriptor
clc
clf
clear 
close all

img = read_as_grayscale('paper_with_digits.png');
position = [400; 300];
radius = 10; 


desc = gradient_descriptor(img, position, radius);


%% prepare_digits
clc
clf
clear
close all

load digits.mat;

center = [20, 20];
radius = 6;


% Compute descriptors for all 100 training images. 
for i=1:length(digits_training)
    img = digits_training(i).image;
    digits_training(i).descriptor = gradient_descriptor(img,center,radius);
end



img = digits_validation(7).image;
imagesc(img), colormap gray;


nr = classify_digit(img, digits_training)

%% classify_all_digits
clc
clf
clear
close all

load digits.mat;
errors = 0; 
for i=1:length(digits_validation)
    img = digits_validation(i).image;
    label = classify_digit(img, digits_training); 
    
    if label ~= digits_validation(i).label
        errors = errors + 1; 
    end
    
    
end

successRate = (1-errors/length(digits_validation))*100      % Correct answers in %

%% extractSIFT
clc
clf
clear
close all

img = read_as_grayscale('paper_with_digits.png');
[coords, descriptors] = extractSIFT(img);



