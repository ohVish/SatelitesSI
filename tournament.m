function padres = tournament(PobFit,k)
    padres = zeros(1,length(PobFit));
    for i=1:length(PobFit)
        numbers = round(rand(1,k)*(length(PobFit)-1) + 1);
        [~,padres(i)] = max(PobFit(numbers));
    end
    padres = padres';
end