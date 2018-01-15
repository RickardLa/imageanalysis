% Ex 1
clc
clf
clear all
close all


tempLength = 35;
dataLength = 200;
T = zeros(tempLength);
ones = ones(tempLength); 

load bloodcells/cell_data.mat;
imgFG = cell_data.fg_patches;
imgBG = cell_data.bg_patches;


for i=1:length(imgFG)
    T = T + imgFG{i}; 
end

T = T/dataLength;
meanT = mean(T(:));

w = (T-meanT*ones)/tempLength;

% product = 0; 
for j=1:dataLength
    product(j) =  sum(dot(w,imgBG{j}));
end

summa = 0; 
for k=1:dataLength
    prod(k) =  sum(dot(w,imgFG{k}));
    
    if prod(k)>0.02 
        summa = summa +1;
    end
    
end

plot(1:200,product,'.')
hold on
plot(1:200,prod,'.')





        
    
