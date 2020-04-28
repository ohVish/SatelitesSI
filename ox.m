function offs=ox(p,f1,f2)
%% This function will be PMXcrossover  OR  OXcrossover
%% p: two parents to cross, a parent per row
%% f1 & f2: crossover points
%% offs: two offsprings, a child per row

     N=length(p);

     offs = zeros(2,N);
     offs(1,f1:f2)=p(1,f1:f2);
     offs(2,f1:f2)=p(2,f1:f2);

     p1=1;

     p2=mod(p1,2)+1;
     j=f2+1;  
     k=f2+1;

     while j~=f1
        cand=(find(offs(p1,:)==p(p2,k)));
        if isempty(cand)
            offs(p1,j)=p(p2,k);
            j=mod(j,N)+1;
        end
        k = mod(k,N)+1;
     end
     
     p1=p1+1;
     p2=mod(p1,2)+1;
     j=f2+1;  
     k=f2+1;

    while j~=f1
        cand=(find(offs(p1,:)==p(p2,k)));
        if isempty(cand)
            offs(p1,j)=p(p2,k);
            j=mod(j,N)+1;
        end
        k = mod(k,N)+1;
    end
end
 
 
 
