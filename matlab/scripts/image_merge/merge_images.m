function [ output_image ] = merge_images( input_images )
%MERGE_IMAGES Merges 4 images into one horizontally
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
    output_image = [image1 image2 image3 image4];
    clear image1;
    clear image2;
    clear image3;
    clear image4;
end

