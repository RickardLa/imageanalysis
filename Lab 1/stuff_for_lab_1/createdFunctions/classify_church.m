function [label, name] = classify_church(image, feature_collection)

[~, descriptors] = extractSIFT(image);         % SIFT of input-image

% Find matching features in input-image and the collection of features
% given to us

% MaxRatio 0.6 gave lowest error rate
corrs = matchFeatures(feature_collection.descriptors',descriptors', 'MatchThreshold', 100, 'MaxRatio', 0.6);

summa = feature_collection.labels(corrs(:,1));      % Extract labels of matching feature points
vote = zeros(1,5); 

% Sum the # of occurences of idx 1,2,3,4,5
for i=1:5
    vote(i) = sum(summa==i);
end

[~, label] = max(vote);                     % Pick the one with highest weight

name = feature_collection.names(label);     % Return the name corresponding to 'label'

end
