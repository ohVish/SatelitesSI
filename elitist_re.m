function [Pob,PobFit] = elitist_re(Pob,newPob,PobFit,newFit)
    NB = size(Pob,1);
    Pob_aux = [Pob; newPob];
    PobFit = [PobFit; newFit];
    Pob_aux = [Pob_aux PobFit];
    Pob_aux = sortrows(Pob_aux,size(Pob_aux,2),'ascend');
    Pob = Pob_aux(1:NB,1:end-1);
    PobFit = Pob_aux(1:NB,end);
end