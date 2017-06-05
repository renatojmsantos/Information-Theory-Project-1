function InfMut = InfMut(query,target,alfa,vec1)
    p=zeros(length(alfa));
    tam_q = sum(vec1);
    probQ=vec1/tam_q;                             %probabilidade do Query
    vec2=vecOc(target,alfa);                    %Faz as ocorrencias do target
    close;                                %Como a funçao também faz um histograma que nao precisamos, faz-se close
    tam_t = sum(vec2);
    probT=vec2/tam_t;                           %probabilidade do Target
    for i = 1:length(query)                     %Cria o agrupamento entre query e target
        findQ = find(alfa==query(i));
        findT = find(alfa==target(i));
        p(findQ, findT) = p(findQ, findT) + 1;
    end
    tamanho_p = sum(sum(p));
    prob = p / tamanho_p;
    InfMut=0;                                   %inicia-se a 0
    for i=1:length(probQ)                       %%Fórmula2 I(Q;T)=p(Q=i,T=j).*log2(p(Q=i,T=j)/(p(Q=i).*p(T=j))) <- formula de informação mútua.
        for j=1:length(probT)
            if((prob(i,j)~=0) && (probQ(i)*probT(j)~=0))
                InfMut = InfMut + (prob(i,j)*log2(prob(i,j)/(probQ(i)*probT(j))));
            end
        end
    end
end