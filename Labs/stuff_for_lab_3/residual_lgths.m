function residual_lgths = residual_lgths(A, t, pts, pts_tilde)

    % Calculate resíduals
    
    r = zeros(size(pts));
    
    for i=1:length(pts)        
        r(:,i) = A*pts(:,i) + t(:) - pts_tilde(:,i);   % eq 8.12     
    end
    
    residual_lgths = sum(r.^2,1);
    

end