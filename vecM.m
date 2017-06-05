function vecM = vecM(query,target,alfa,step)
    k=1:step:(length(target)-length(query)+1);       %Define um intervalo entre janelas consecutivas(passo)
    tam_elem=length(k);                               
    vecM=zeros(1,tam_elem);         %cria matriz de zeros com o tamanho da janela especificada                   
    pos=1;
    vec1=vecOc(query,alfa);          %Funçao de criação do vetor de ocorrencias
    close;                     %como na função também se é feito um histograma com as ocorrencias, o que nao precisamos, faz-se close dessa janela
    for a=1:tam_elem                 %Inforação mútua de cada janela
        vecM(a)=InfMut(query, target(pos:pos+length(query)-1), alfa,vec1);   %o argumento target faz a janela deslizar a cada iteração
        pos=pos+step;                %incrementa o step para determinar o novo intervalo da janela
    end
end