function Entropy = entropy(p, alfa, vec)
    x = zeros(1, length(alfa)); %cria uma matriz 1xAlfa
    DimMatriz = size(p); % dimensões da matriz, por exemplo se a matriz for 2x3, DimMatriz = 2 3
    tamP = DimMatriz(1)*DimMatriz(2); %calcula-se o numero total de elementos da matriz, ex 2*3 = 6
    for i=1:length(alfa)
        x(i)=vec(i)/tamP;    
    end
    num = x(x~=0); %retira os zeros ja que vamos usar a funçao da entropia e nao pode haver log2(0)
    Entropy=-sum(num*log2(num'));
end