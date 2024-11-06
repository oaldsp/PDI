%==================================================================
%   ALUNOS:
%   OTÁVIO PEPE
%   VICTOR DAMASCENO
%==================================================================
close all; clear all; clc;

imgR = imread('einstein.gif');
img12 = imread('meanshift.gif'); %imagem12 na organizacao dos slides 
img13 = imread('contrast.gif');  %imagem13  
img21 = imread('impulse.gif');   %imagem21 
img22 = imread('blur.gif');      %imagem22 
img23 = imread('jpg.gif');       %imagem23 

%MSE
qeR  = immse(imgR, imgR);  %0
qe12 = immse(imgR, img12); %143.9945
qe13 = immse(imgR, img13); %144.2188
qe21 = immse(imgR, img21); %143.9390
qe22 = immse(imgR, img22); %143.9085
qe23 = immse(imgR, img23); %141.9529   
   
%SSIM
qsR  = ssim(imgR, imgR) ; %1
qs12 = ssim(imgR, img12); %0.9873
qs13 = ssim(imgR, img13); %0.9012
qs21 = ssim(imgR, img21); %0.8395
qs22 = ssim(imgR, img22); %0.7022
qs23 = ssim(imgR, img23); %0.6699

%==================================================================
%   1. A ‘Demonstration’ foi reproduzida com sucesso?
%   R: C - Sim. Embora os resultados possam não ser numericamente 
%   idênticos, são muitíssimos parecidos.
%==================================================================
%   2. Por que o índice SSIM é melhor que o MSE neste experimento?
%   R: B - Porque o MSE apresenta valores praticamente iguais para 
%   qualidades notavelmente diferentes das imagens, enquanto o SSIM
%   captura essas diferenças, além de apresentar valores compatíveis
%   com a noção de qualidade que seria atribuída por uma pessoa (SVH).
%==================================================================
