function [Pob] = GenPob(M,NB,station)
    Pob = zeros(NB,M);
    for i=1:NB
        Pob(i,:) = randperm(size(station,1),M);
    end
end