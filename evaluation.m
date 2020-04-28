function result = evaluation(stations, solution)
    N = size(stations,1);
    
    noSelec = 1:N;
    noSelec(solution) = [];
    
    
    euclideanDistances = pdist2(stations(noSelec,:),stations(solution,:));
    
    minDistances = min(euclideanDistances,[],2);
    
    result = sum(minDistances);
end