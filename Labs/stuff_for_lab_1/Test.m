% Testing
clc
clf
clear all
close all

img = read_as_grayscale('church_test/church1.jpg');
% img = read_image('church_test/church1.jpg');
imagesc(img), colormap gray
figure

patch = get_patch(img, 400,300, 200);


imagesc(patch), colormap gray