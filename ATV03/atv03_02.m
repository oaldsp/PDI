img = imread('gDSC04422m16.png')
imhist(img)
normhist = (imhist(img))/(240*320);
cdf = cumsum(normhist);
cdfr = uint8(cdf.*255);
res = intlut(img, cdfr);
histeq = histeq(img,256);
figure;
subplot(1,2,1)
imshow(histeq)
title('Equalizacao MATLAB')
subplot(1,2,2)
imshow(res)
title('Equalizacao Unha')
imwrite(res, 'histeqUnha.png');
imwrite(histeq, 'histeqMatlab.png');
