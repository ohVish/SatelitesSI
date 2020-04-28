function tmpPob = simple_cross(parejas,Pob)
    tmpPob = zeros(numel(parejas),size(Pob,2));
    j=1;
    for i=1:size(parejas,1)
        tmpPob(j,:) = Pob(parejas(i,1),:);
        tmpPob(j,3:end)= Pob(parejas(i,2),3:end);
        tmpPob(j+1,:) = Pob(parejas(i,2),:);
        tmpPob(j+1,3:end)= Pob(parejas(i,1),3:end);
        j = j + 2;
    end
    
end