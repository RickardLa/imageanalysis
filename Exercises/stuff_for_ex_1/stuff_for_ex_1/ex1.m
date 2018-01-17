% Ex 1.12
clc
clf
clear all
close all

load bloodcells/cell_data.mat;  % Loading data 
imgFG = cell_data.fg_patches;   % Foreground images
imgBG = cell_data.bg_patches;   % Background images

tempLength = 35;            % Size of patches are 35 by 35 pixels
dataLength = 200;           % 200 images in total



T = zeros(tempLength);           
for i=1:length(imgFG)
    T = T + imgFG{i};           % Create template by averaging all FG-images
end
T = T/dataLength;

meanT = mean(T(:));                         % Mean value of template

w = (T-meanT*ones(tempLength))/tempLength;  % Linear classifier. Subtract mean. 

productBG = zeros(dataLength);
productFG = zeros(dataLength);
sumBG = 0;
sumFG = 0; 

threshold = 0.02;                           % Set threshold for classifier


for j=1:dataLength
    productBG(j) =  sum(dot(w,imgBG{j}));   % Dot product between classifier and image
    productFG(j) =  sum(dot(w,imgFG{j}));

    if productBG(j,1) <= threshold          
        sumBG = sumBG +1;                   % Count # of BG-images 
    end
    if productFG(j,1) > threshold
        sumFG = sumFG +1;                   % Count # of cells found  
    end


end
    
    


EBG = (1-sumBG/200)*100           % Error rate in %
EFG = (1-sumFG/200)*100 






plot(1:200,productFG(:,1),'*')
hold on
plot(1:200,productBG(:,1),'*')
hold on
plot([1 200], [1 1]*threshold)
legend('Foreground','Background','Threshold')


%% Ex 1.15
clc
clf
clear all
close all

threshold = 0.01; 
load linearClassifier.mat;
imgGray = read_as_grayscale('bloodcells/test_images/092.png');



imgGray = padarray(imgGray,[50 50],'s');                % Mirror image to find edge/corner-cells 
result = imfilter(imgGray,w);                           % Filter with linear classifier

result(result >= threshold) = 1;                        % Assign 1 if cell found

view_with_overlay(imgGray, result);             
hold on
rectangle('Position',[50 50 388 260])

%% Ex 1.20
clc
clf
clear all
close all



imgGray = read_as_grayscale('bloodcells/test_images/092.png');
imgGray = padarray(imgGray,[50 50],'s');                % Mirror image to find edge/corner-cells 

cells = cell_detector(imgGray);

imagesc(imgGray), colormap gray
hold on
plot(cells(1,:),cells(2,:),'y*')
hold on
rectangle('Position',[50 50 388 260])


    
