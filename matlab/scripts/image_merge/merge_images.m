function [ output_image ] = merge_images( input_images, shift )
%MERGE_IMAGES Merges 4 images into one horizontally also shifting two first
% images vertically 'shift' pixels up and omits 'shift' last pixels of the third
% and fourth image.
    for i = 2 : size(input_images, 2)
        name1 = input_images(i-1).name(1:end-8);
        name2 = input_images(i).name(1:end-8);
        if ~strcmp(name1, name2)
            error('Images filenames do not match [%s != %s]', name1, name2);
        end
    end
    image1 = imread(sprintf('Cam00\\%s', input_images(1).name));
    image2 = imread(sprintf('Cam01\\%s', input_images(2).name));
    image3 = imread(sprintf('Cam02\\%s', input_images(3).name));
    image4 = imread(sprintf('Cam03\\%s', input_images(4).name));
    output_image = [image1(1+shift:end,:,:) image2(1+shift:end,:,:) ...
        image3(1:end-shift,:,:) image4(1:end-shift,:,:)];
    clear image1;
    clear image2;
    clear image3;
    clear image4;
end