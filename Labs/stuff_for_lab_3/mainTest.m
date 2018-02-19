%% 1
clc
clf
clear
close

img = read_image('examples/mona.png');
% A = [0.88 -0.48; 0.48 0.88];
A = eye(2);
% t = [100;-100];
t = zeros(2,1);
target_size = size(img);
warped = affine_warp(target_size, img, A, t);
imagesc(warped);
axis image;


%% 2
clc
clf
clear
close

outlier_rate = 0.5; 
threshold = 3; 
[pts, pts_tilde, A_true, t_true] = affine_test_case(outlier_rate);

% [A, t] = estimate_affine(pts, pts_tilde)

[A,t] = ransac_fit_affine(pts, pts_tilde, threshold);


% residual_lgths = residual_lgths(A, t, pts, pts_tilde)