directory = 'Cam';
img_format = 'png';
bg_image = imread(sprintf('img_bg_avrg.%s',img_format));

image_numbers = 1:23; % stanowisko #1
%image_numbers = 1:203; % stanowisko #2
for i = image_numbers
    file = dir(sprintf('%s\\img%05d.%s', directory, i, img_format));
    fprintf('Processing %s ... Tresholding ... ', file.name);
    image = imread(sprintf('%s\\%s', directory, file.name));
    image = image - bg_image; % stanowisko #1
    %image = bg_image - image; % stanowisko #2
    image = im2bw(image, 0.3);
    output_file = sprintf('%s\\img%05d_bw.%s', directory, i, img_format);
    fprintf('Saving %s ... ', output_file);
    imwrite(image, output_file);
    
    fprintf('Labeling ... ');
    L = labelmatrix(bwconncomp(image));
    Limage = label2rgb(L);
    output_file = sprintf('%s\\img%05d_labeled.%s', directory, i, img_format);
    fprintf('Saving %s ... ', output_file);
    imwrite(Limage, output_file);
    disp('Done!');
end