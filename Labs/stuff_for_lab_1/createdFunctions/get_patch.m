function patch = get_patch(image, x, y, patch_radius)

[rowImg,colImg, dim] = size(image);                 % Size of original image


% Range of patch in rows and columns
rowPatch = (y-patch_radius):(y+patch_radius);
colPatch= (x-patch_radius):(x+patch_radius);

% If patch is outisde of image, display error message
if length(rowPatch) > rowImg || length(colPatch) > colImg
    error('Patch is outside image border')
end


if dim == 3                                  % If 'image' is RGB, the 3 channels
    R = image(:,:,1);                        % have to be treated individually
    G = image(:,:,2);
    B = image(:,:,3);
    
    patchR = R(rowPatch,colPatch);
    patchG = G(rowPatch,colPatch);
    patchB = B(rowPatch,colPatch);
    
    patch = cat(3,patchR,patchG,patchB);     % Concatenate color channels
else                                         % If grayscale, image is cropped directly
    patch = image(rowPatch,colPatch);
    
end


end
