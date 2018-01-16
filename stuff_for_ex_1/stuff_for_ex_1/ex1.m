% Ex 1
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





        
    