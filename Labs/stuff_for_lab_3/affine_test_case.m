function [pts, pts_tilde, A_true, t_true] = affine_test_case(outlier_rate)
    
    N = 100;    
    N_outliers = N*outlier_rate; 
    
    
    % Create points
    pts = [randperm(N); randperm(N)];    
    
    
    a = abs(randn);
    b = abs(randn);
           
    A_true = [a -b; b a];
    t_true = [10; -10];
    
    temp = A_true * pts;
    
    pts_tilde(1,:) = temp(1,:) + t_true(1);
    pts_tilde(2,:) = temp(2,:) + t_true(2);
    
    % Create outliers
    outliers_index = randperm(N,N_outliers);   
    for i=outliers_index
        pts_tilde(:,i) = pts_tilde(:,i) + [randn; randn];
    end
    
end