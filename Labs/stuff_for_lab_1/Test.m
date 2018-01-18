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