function newPob = swap_ga(tmpPob,Pmut,N)
    newPob = zeros(size(tmpPob));
   for i=1:size(tmpPob,1)
        if rand()<Pmut
            selected = randperm(size(tmpPob,2),1);
            selectStation = randperm(N,1);
            while ~isempty(find(tmpPob==selectStation, 1))
                selectStation = randperm(N,1);
            end
            
            tmpPob(i,selected) = selectStation;
            newPob(i,:) = tmpPob(i,:);
        else
            newPob(i,:) = tmpPob(i,:);
        end
   end
end