function vec = vecOc(p, alfa)
    vec = zeros(length(alfa),1);        %cria uma matriz de zeros alfa x 1                     
    for i=1 : length(alfa)              
        [n,~] = find(p==alfa(i));    %Procura as occorencias de alfa em info
        vec(i) = length(n);             %guarda nº de ocorrencia vec
    end
    bar(alfa, vec)                   %cria o histograma com base nas ocorrencias
    xlabel('Alfabeto')
    ylabel('Ocorrências')
    axis 'auto x';
    axis 'auto y';
    title('Numero de ocorrências: ')
end