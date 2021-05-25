img = imread('common-rust-disease.jpg');

bw=im2bw(img, 0.5);
label= bwlabel(bw);

stats = regionprops(label, 'Solidity', 'Area');

density = [stats.Solidity];
area= [stats.Area];

high_dense_area = density>0.1;
max_area = max(area(high_dense_area));
leaf_label = find(area ==max_area);
leaf = ismember(label, leaf_label);

se = strel('Square',1);
leaf = imdilate(leaf,se);

figure(2)

subplot(1,3,1)
imshow(img,[])
title('S1')

subplot(1,3,2)
imshow(leaf,[])
title('s2')

[B,L] = bwboundaries(leaf,'noholes');
subplot(1,3,3)
imshow(img,[])
hold on
for i= 1:length(B)
    plot(B{i}(:,2),B{i}(:,1), 'y', 'linewidth', 2)
end
title('s3')