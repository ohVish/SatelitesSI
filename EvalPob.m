function [PobFit] = EvalPob(Pob,stations)
    PobFit = zeros(size(Pob,1),1);
    for i=1:size(Pob,1)
        PobFit(i) = evaluation(stations,Pob(i,:));
    end
end