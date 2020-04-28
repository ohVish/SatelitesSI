function [best,evalBest] = tabuSearch(stations,M)
    selected = datasample(1:size(stations,1),M,'Replace',false);
    tabu = zeros(1,M);
    best = selected;
    evalBest = evaluation(stations,selected);
    actual = selected;
    i = 1;
    
    while sum(tabu ~= 0) < M && i <= 100
        disp("--- ITER "+i+" ---");
        disp("Best: "+num2str(best)+" ("+evalBest+")");
        disp("Actual: "+num2str(actual)+" ("+evaluation(stations,actual)+")");
        disp("Tabu array: "+num2str(tabu));
        disp(" ");
        disp(" ");
        
        notZeros = (tabu > 0);
        tabu = tabu - notZeros;
        
        sucessors = zeros(M,M);
        costs = zeros(1,M);
        for j = 1:M
            su = actual;
            
            encontrado = true;
            while encontrado                
                if su(j)+1 > size(stations,1)
                    su(j) = 1;
                else
                    su(j) = su(j)+1;
                end
                if sum(su == su(j))>1
                    encontrado = false;
                end
            end
            
            costs(j) = evaluation(stations,su);
            sucessors(j,:)= su;
        end
        
        decided = false;
        while ~decided
            [value, pos] = min(costs);
            if value < evalBest
                best = sucessors(pos,:);
                evalBest = value;
                actual = sucessors(pos,:);
                tabu(pos) = M-1;
                decided = true;
            else
                if tabu(pos) == 0
                    actual = sucessors(pos,:);
                    tabu(pos) = M-1;
                    decided = true;
                else
                    costs(pos) = Inf;
                end
            end
        end
        
        i = i+1;
    end
end

