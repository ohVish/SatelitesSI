function [Padres] = roulette(PobFit)
    total = sum(PobFit);
    separators = cumsum(PobFit/total);
    Padres = zeros(length(PobFit),1);
    for i=1:length(PobFit)
        index = find(separators>=rand());
        Padres(i) = index(1);
    end
end