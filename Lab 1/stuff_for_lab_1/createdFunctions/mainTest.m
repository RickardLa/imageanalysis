% Testing
% This script was used for testing all our created functions. 


%% get_patch
clc
clf
clear 
close all

% img = read_as_grayscale('church_test/church1.jpg');
img = read_image('church_test/church1.jpg');
imagesc(img)
figure

patch = get_patch(img, 300,500, 100);


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
correct = 0; 
for i=1:length(digits_validation)
    img = digits_validation(i).image;
    label = classify_digit(img, digits_training);
    
    if label == digits_validation(i).label
        correct = correct + 1; 
    end
    
    
end
% correct
successRate = correct/length(digits_validation)*100      % Correct answers in %

%% extractSIFT
clc
clf
clear
close all

load church_data.mat;

image = read_as_grayscale('church_test/church2.jpg');
[coords, descriptors] = extractSIFT(image);     




corrs = matchFeatures(feature_collection.descriptors',descriptors', 'MatchThreshold', 100, 'MaxRatio', 0.7);






% 
imagesc(image), colormap gray
hold on
% plot(,,'*')

% [label, name] = classify_church(image, feature_collection);



%% classify_church
clc
clf
clear 
close

load manual_labels.mat;
load church_data.mat;

correct = 0; 
for i=1:10
    src = 'church_test/church'; 
    image = read_as_grayscale([src num2str(i) '.jpg']);
    [label, name] = classify_church(image, feature_collection);
    
  
              
    diff = setdiff(name,manual_labels{i});
    if  isempty(diff) == 1
        correct = correct + 1;     
    end






end

    
   


%% classify_church
clc
clf
clear
close 

image = read_as_grayscale('church_test/church10.jpg');
load church_data.mat;
load manual_labels.mat; 
[label, name] = classify_church(image, feature_collection)






