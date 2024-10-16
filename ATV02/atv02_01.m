%==================================================================
%ALUNOS:
%OTÁVIO PEPE
%VICTOR DAMASCENO
%==================================================================
%Porque aparecem pixels pretos (“buracos”) na imagem rotacionada?
%
%R: Porque ao se aplicar a transformação(rotação) na imagem inicial 
%temos valores de coordenadas quebrados que não são possíveis de serem
%representados na imagem final, pois são aceitos somente valores de
%coordenadas inteiras. Dado isso, é feito um arredondamento utilizando
%o piso do valor da coordenada quebrada mais um(teto para números não 
%inteiros). Ao se fazer esse arredondamento, nem todas as coordenadas
%da imagem final apresentam uma correspondência na imagem inicial, 
%fazendo assim com que a cor preta que foi definida na inicialização
%da matriz que representa a imagem final não seja sobrescrita por 
%outro valor, mantendo assim sua cor inicial preta. 
%==================================================================
close all; clear all; clc;
G = imread('cameraman.tif');
nr = size(G,1);
nc = size(G,2);
[X,Y] = meshgrid(1:nr,1:nc);
 N = nr*nc;
 I = [X(:)';
  Y(:)';
  ones(1,N)];
 ang = 30*pi/180;
 T = [ cos(ang) sin(ang) 0;
  -sin(ang) cos(ang) 0;
  0 0 1];
 K = T*I;
 temp1 = min(K, [], 2);
 m = repmat(temp1, 1, N);
 temp2 = K - m;
 Kadj = 1 + floor(temp2);
 nrOut = max(Kadj(1,:));
 ncOut = max(Kadj(2,:));
 Gout = uint8(zeros(nrOut, ncOut));
 for k = 1:length(Kadj)
  Gout(Kadj(1,k), Kadj(2,k)) = G(I(1,k), I(2,k));
 end
 imshow(Gout);