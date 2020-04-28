function offs=pmx_crossover(p,f1,f2)
%% p: two parents to cross, a parent per row
%% f1 & f2: crossover points
%% offs: two offsprings, a child per row
     N=length(p);

     offs = zeros(2,N);
     % Copy values between f1:f2
     offs(1,f1:f2)=p(2,f1:f2);
     offs(2,f1:f2)=p(1,f1:f2);

     ic = [p(1,f1:f2);p(2,f1:f2)];

     em=find(offs(1,:)==0); %% empty positions to fill up
     p1=1;

     p2=mod(p1,2)+1;
     for j=em
        cand = p(p1,j); %%candidate value
        %  conflicts checking
        index = find(ic(p2,:)==cand);
        while ~isempty(index)
           cand = ic(p1,index);
           index = find(ic(p2,:)==cand);
        end
        offs(p1,j) = cand;
     end
     
     p1=p1+1;
     p2=mod(p1,2)+1;
     
     em=find(offs(p1,:)==0); %% empty positions to fill up
     for j=em
        cand = p(p1,j); %%candidate value
        %  conflicts checking
        index = find(ic(p2,:)==cand);
        while ~isempty(index)
           cand = ic(p1,index);
           index = find(ic(p2,:)==cand);
        end
        offs(p1,j) = cand;
     end
end

