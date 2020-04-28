function [sol,gmax,itera] = ga_nqueens(NQ,NB,MAX_itera,Pcross,Pmut,s_type,c_type)
    %%
    M= 40 ; %% N�mero de estaciones seleccionadas
    N= 500; %% Numero de Tableros/Individuos de la poblacion
    NB = 50;
    width = 500;
    height = 500;
    MAX_itera=3000;
    Pcross=0.9;
    Pmut=0.1;
    s_type=SelectionType.ROULETTE;
    c_type =CrossOverType.SIMPLE;
    
    stations = genN(N,width,height);

    % Poblaci�n Inicial
    
    Pob=GenPob(M,NB,stations);
    PobFit=EvalPob(Pob,stations);
    
    itera=1;
    k=3;
    [gmax,gmax_i] = min(PobFit);
    sol = Pob(gmax_i,:);
    repeat = 0;
    while itera<=MAX_itera && repeat<10 % Termina si encuentra soluci�n �ptima
        if s_type==SelectionType.ROULETTE
            Padres=roulette(PobFit);%% devuelve los indices de los padres que se cruzaran
        else
            Padres=tournament(PobFit,4);%% devuelve los indices de los padres que se cruzaran
        end
         parejas=Emparejar(Padres,Pcross);
         
         if c_type == CrossOverType.SIMPLE
            tmpPob= simple_cross(parejas,Pob); %%devuelve nueva poblacion cruzada
         else if c_type == CrossOverType.OX
                tmpPob= ox_crossover(parejas,Pob); %%devuelve nueva poblacion cruzada
             else
                tmpPob= pmx_crossover(parejas,Pob); %%devuelve nueva poblacion cruzada
             end
         end
         newPob=swap_ga(tmpPob,Pmut,N); %%poblacion con mutaciones
         newFit=EvalPob(newPob,stations);

         [Pob,PobFit]=elitist_re(Pob,newPob,PobFit,newFit);
         itera=itera+1;
         
         % Criterio de convergencia
         [nmax,nmax_i] = min(PobFit);
         if nmax<gmax
             repeat = 0;
             gmax = nmax;
             gmax_i = nmax_i;
         else
             gmax_i = nmax_i;
             repeat = repeat + 1;
         end
         sol = Pob(gmax_i,:);
    
    end
 
    
end