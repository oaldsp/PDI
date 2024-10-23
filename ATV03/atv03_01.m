%Sigmoid
%Aloca uint8
%para depois usar funcao intlut (y1 é a LUT)
%Equação da sigmoide
slope = 0.09;
inflec = 127;
x = 0:1:255;
y1 = 1./(1 + exp(-slope*(x - inflec)));
y1n = mat2gray(y1);
y1n = uint8(y1n.*255);
%Display
figure, plot(y1n)
xlim([0 255]), ylim([0 255])
grid on
title('Sigmoide')
xlabel('x'), ylabel('y')
saveas(gcf, 'sigmoide_009.png')
img = imread('vpfig.png');
res = intlut(img, y1n);
imshow(img)
imshow(res)
imwrite(res, 'vpfig009.png');
%e possivel observar que um slope maior 
%resulta em um contraste maior e, nesse
%caso, uma melhor visualizacao da figura
%resultados na pasta do projeto para slopes
%0.01, 0.05 e 0.09