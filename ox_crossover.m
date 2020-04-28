function tmpPob = ox_crossover(parejas,Pob)
    N = size(Pob,2);
    tmpPob = zeros(numel(parejas),N);
    j=1;
    for i=1:size(parejas,1)
        p = [Pob(j,:);Pob(j+1,:)];
        f1 = round(N*0.25);
        f2 = round(N*0.75);
        offs = ox(p,f1,f2);
        tmpPob(j:j+1,:) = offs;
        j = j + 2;
    end
    
end