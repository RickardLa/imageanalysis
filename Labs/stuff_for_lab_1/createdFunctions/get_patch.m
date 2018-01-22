function patch = get_patch(image, x, y, patch_radius)

[colImg,rowImg, dim] = size(image);                 % Size of original image


% Range of patch in rows and columns
rowPatch = (y-patch_radius):(y+patch_radius);
colPatch= (x-patch_radius):(x+patch_radius);

% If patch is outisde of image, display error message
if max(rowPatch) > rowImg || max(colPatch) > colImg 
    error('Patch is outside image border')
elseif min(rowPatch) < 1 || min(colPatch) < 1
    error('Negative index')
end


if dim == 3                                  % If 'image' is RGB, the 3 channels
    R = image(:,:,1);                        % have to be treated individually
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
