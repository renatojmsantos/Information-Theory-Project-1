function EntC = EntConj(info, alfa)
    p = zeros(length(alfa));            %cria uma matriz de zeros, Alfa (255^2)
    DimInfo = size(info);               %dimensões da matriz
    tamP = DimInfo(1)*DimInfo(2);       %calcula o numero total de elementos
    if(mod(tamP,2) == 1)                %se tamP for impar, ignora o ultimo elemento
        tamP = tamP - 1;
    end
    for i=1:2:tamP                                             %percorre os simbolos de 2 a 2
        findElem1 = find(info(i) == alfa);                     %procura o primeiro simbolo (ocorrencia)
        findElem2 = find(info(i+1) == alfa);                   %procura o segundo simbolo  (ocorrencia)
        p(findElem.1, findElem2) = p(findElem1, findElem2)+1;   %incrementa-se p
    end
    p = p/(tamP/2);          %Como é entropia conjunta, a prob é igual as ocorrencias sobre metade do tamanho da fonte
    p(p == 0) = [];
    EntC=-sum(p*log2(p'));
end
