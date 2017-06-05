%Determinar os alfabetos:
AlfaImg = (0:256);     %alfabeto para uma imagem  

%Ex3) - Binaria.bmp
figure(01)
disp('Binaria.bmp:');
imgBin =  imread('dados\Binaria.bmp');
vec1 = vecOc(imgBin, AlfaImg);
Entropy = entropy(imgBin,AlfaImg,vec1)
%Ex4) - Binaria.bmp
prob = vec1/sum(vec1);
disp('Entropia com Hufflen: ');
Huff = sum(hufflen(vec1).*prob)  
%Ex5) - Binaria.bmp
disp('Entropia Agrupada - Binaria.bmp');
disp('Entropia Conjunta:');
EntSimb= EntConj(imgBin, AlfaImg)/2
disp('Press any key to continue..');
pause;
clc;


%Ex3) - CT1.bmp
figure(02)
disp('CT1.bmp:');
imgCT1=imread('dados\CT1.bmp');
vec2 = vecOc(imgCT1, AlfaImg);
Entropy = entropy(imgCT1,AlfaImg, vec2)
%Ex4) - CT1.bmp
prob = vec2/sum(vec2);
disp('Entropia com Hufflen: ');
Huff = sum(hufflen(vec2).*prob)
%Ex5) - CT1.bmp
disp('Entropia Agrupada - CT1.bmp');
disp('Entropia Conjunta: ');
EntSimb = EntConj(imgCT1, AlfaImg)/2
disp('Press any key to continue..');
pause;
clc;


%Ex3) - Lena.bmp
figure(03)
disp('Lena.bmp:');
imgLena = imread('dados\Lena.bmp');
vec3 = vecOc(imgLena, AlfaImg);
Entropy = entropy(imgLena, AlfaImg, vec3)
%Ex4) - Lena.bmp
prob = vec3/sum(vec3);
disp('Entropia com Hufflen: ');
Huff = sum(hufflen(vec3).*prob)
%Ex5) - Lena.bmp
disp('Entropia Agrupada - Lena.bmp');
disp('Entropia Conjunta : ');
EntSimb = EntConj(imgLena,AlfaImg)/2
disp('Press any key to continue..');
pause;
clc;


%Ex3) - saxriff.wav - neste caso só usar a funçao histogram não funciona,
%pro isso usa-se o vecOc e a função bar(x,y);
figure(04)
wavSax = audioread('dados\saxriff.wav');
[sample,~,NBits] = audioread('dados\saxriff.wav');  %
d = (1-(-1))/(2^NBits);                           % Aqui estamos a definir o alfabeto de um som
AlfaWav = (-1:d:1-d);                             %
disp('saxriff.wav:');
vec4 = vecOc(wavSax, AlfaWav);
Entropy = entropy(wavSax, AlfaWav, vec4)
%Ex4) - saxriff.wav
prob = vec4/sum(vec4);
disp('Entropia com Hufflen: ');
Huff = sum(hufflen(vec4).*prob)
%Ex5) - saxriff.wav
disp('Entropia Agrupada - saxriff.wav');
disp('Entropia Conjunta : ');
EntSimb = EntConj(audioread('dados\saxriff.wav'),AlfaWav)/2
disp('Press any key to continue..');
pause;
clc;


%Ex3) - Texto.txt - mesma situação para ficheiros de texto, sera necessario
%usar vecOc para determinar as ocorrencias e fazer o histograma a partir do
%bar(x,y).
figure(05)
AlfaAZ = ['A':'Z' 'a':'z'];                     %alfabeto A-Z (incluindo minusculas)
fp = fopen('dados\Texto.txt');
disp('Texto.txt:');
fileText = fscanf(fp, '%s');
vec5 = vecOc(uint8(fileText), uint8(AlfaAZ));
Entropy = entropy(fileText,AlfaAZ, vec5)
%Ex4) -texto.txt
prob = vec5/sum(vec5);
disp('Entropia com Hufflen: ');
Huff = sum(hufflen(vec5).*prob)
%Ex5) - Texto.txt
disp('Entropia Agrupada - Texto.txt');
disp('Entropia Conjunta : ');
EntSimb = EntConj(fileText,AlfaAZ)/2
disp('Press any key to continue..');
pause;
clc;
close all

%Exercicio 6)
%A)
disp('Ex 6)');
disp('Informação Mútua: ');
AlfaEx = 0:10;
query = [2 6 4 10 5 9 5 8 0 8];
target = [6 8 9 7 2 4 9 9 4 9 1 4 8 0 1 2 2 6 3 2 0 7 4 9 5 4 8 5 2 7 8 0 7 4 8 5 7 4 3 2 2 7 3 5 2 7 4 9 9 6];
step = 1;
vecM1 = vecM(query,target,AlfaEx,step);
plot(vecM1)
xlabel('Alfabeto')
ylabel('Informação Mútua')
axis 'auto x';
axis 'auto y';
title('Ex 6')
for i=1:length(vecM1)
    fprintf('Janela %d: - %.4f -\n', i, vecM1(i));
end
disp('Press any key to continue...');
pause;
clc;

%B - Target 1
disp('Inf Mut - "saxriff.wav" e "target01"');
[query,~,numbits] = audioread('dados\saxriff.wav');
step = ceil(length(query)/4)   %Arredonda o valor length(query)/4 para o maior inteiro possível
targ1 = audioread('dados\target01 - repeat.wav');
targ2 = audioread('dados\target02 - repeatNoise.wav');
vecM2 = vecM(query, targ1,AlfaWav,step);
plot(vecM2);
xlabel('Alfabeto')
ylabel('Informação Mútua')
axis 'auto x';
axis 'auto y';
title('Inf Mut - "saxriff.wav" e "target01"');
for i=1:length(vecM2)
    fprintf('Janela %d - %.4f -\n', i, vecM2(i));
end
disp('Press any key to continue...');
pause;
clc;

%B - Target 2
disp('Inf Mut - "saxriff.wav" e "target02"');
vecM3 = vecM(query, targ2,AlfaWav,step);
plot(vecM3);
xlabel('Alfabeto')
ylabel('Informação Mútua')
axis 'auto x';
axis 'auto y';
title('Inf Mut - "saxriff.wav" e "target02"');
for i=1:length(vecM3)
    fprintf('Janela %d - %.4f -\n', i, vecM3(i));
end
disp('Press any key to continue...');
pause;
clc;

%Exercicio 6) c)
step1 = step;
vecMax = zeros(1,7);
for i=1:7
    targS = sprintf('dados\\Song0%i.wav', i);
    [targS,~,~] = wavread(targS);
    vecMS = vecM(query, targS, AlfaWav, step1);
    p = sprintf('Song0%i.wav',i);
    title(p);
    vecMax(i) = max(vecMS);  %guarda o maior valor de informação mutua
end
[vecMax, ind] = sort(vecMax, 'descend');   %ordena os elementos em order decrescente
for i = 1:7
    fprintf('Inf Mut Máxima - saxriff.wav e Song0%i.wav:  - %.4f -\n', ind(i), vecMax(i));
end
disp('Press any key to continue...');
pause;
close all
clc;