function region_centres = place_regions(centre, radius) 
        
         region_centres= zeros(2,9);
    
    offset = 2*radius;
%                               X                   Y
    region_centres(:,1) = [centre(1)-offset; centre(2)-offset];
    region_centres(:,2) = [centre(1); centre(2)-offset];
    region_centres(:,3) = [centre(1)+offset; centre(2)-offset];
    region_centres(:,4) = [centre(1)-offset; centre(2)];
    region_centres(:,5) = [centre(1); centre(2)];
    region_centres(:,6) = [centre(1)+offset; centre(2)];
    region_centres(:,7) = [centre(1)-offset; centre(2)+offset];
    region_centres(:,8) = [centre(1); centre(2)+offset];
    region_centres(:,9) = [centre(1)+offset; centre(2)+offset];
    
        
        
end
