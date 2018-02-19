function [A,t] = ransac_fit_affine(pts, pts_tilde, threshold)

   [A, t] = estimate_affine(pts, pts_tilde);
   lengths = residual_lgths(A, t, pts, pts_tilde);
   
   [~,idx] = find(lengths>threshold)
   

end

