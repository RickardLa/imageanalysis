function [A, t] = estimate_affine(pts, pts_tilde)

    % Estimate transformation from pts to pts_tilde 
    % eq 8.11 in lecture notes   
    K = 2;
    
    % Create M matrix
    row1 = pts(:,1:K);
    row2 = [-row1(2) row1(1) -row1(4) row1(3)];
    row3 = [1; 0; 1; 0];
    row4 = [0; 1; 0; 1];
    M = [row1(:) row2(:)  row3 row4];
    
    
    % Create v matrix
    temp = pts_tilde(:,1:K);
    v = temp(:);
    
    % Solve equation
   theta = M\v;
   
   % Shape response matrices
   A = [theta(1) -theta(2); theta(2) theta(1)];
   t = [theta(3) theta(4)];

end