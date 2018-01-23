function patch = get_patch(image, x, y, patch_radius)

% x = center column of patch
% y = center row of patch

[colImg,rowImg, dim] = size(image);                 % Size of input image. 
                                                    % dim = 3 --> RGB
                                                    % dim = 1 --> grayscale
                                                    
% Range of patch in rows and columns
colPatch= (x-patch_radius):(x+patch_radius);
rowPatch = (y-patch_radius):(y+patch_radius);

% If patch is outisde of image, display error message
if max(rowPatch) > rowImg || max(colPatch) > colImg 
    error('Patch is outside image border')
elseif min(rowPatch) < 1 || min(colPatch) < 1
    error('Patch is outside image border. (negative index)')
end


if dim == 3                                  % If 'image' is RGB, the 3 channels
    R = image(:,:,1);                        % have to be treated seperately
    G = image(:,:,2);
    B = image(:,:,3);
    
    patchR = R(colPatch,rowPatch);
    patchG = G(colPatch,rowPatch);
    patchB = B(colPatch,rowPatch);
    
    patch = cat(3,patchR,patchG,patchB);     % Concatenate color channels
else                                         % If grayscale, image is cropped directly
    patch = image(colPatch,rowPatch);
    
end


end
