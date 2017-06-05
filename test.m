%Ex3) - CT1.bmp
AlfaImg = (0:256);
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
