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

img = read_image('paper_with_digits.png');

radius = 10;
position = [400; 300]; 
desc = gradient_descriptor(img, position, radius);
