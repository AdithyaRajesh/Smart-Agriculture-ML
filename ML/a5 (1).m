[file,path]=uigetfile('common-rust-disease.jpg');
fname=fullfile(path,file);
he=imread(fname);

imshow(he)
cform = makecform('srgb2lab');
lab_he = applycform(he,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
[cluster_idx ,cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',2);
pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]), title('image labeled by cluster index');
segmented_images = cell(1,6);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

imshow(segmented_images{1}), title('objects in cluster 1');
imshow(segmented_images{2}), title('objects in cluster 2'); 
imshow(segmented_images{3}), title('objects in cluster 3'); 
