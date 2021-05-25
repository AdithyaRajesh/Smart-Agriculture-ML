F=imread('common-rust-disease.jpg');
Igray=rgb2gray(F);
level = 0.5;
Ithresh=im2bw(Igray,level);
imshowpair(F,Ithresh,'montage')
Icomp=imcomplement(F);
Ifilled=imfill(Icomp,'holes');
figure,imshow(Ifilled);