output_directory = 'Cam';
img_format = 'png';
shift = 64; % dla stanowiska #1
%shift = 24; % dla stanowiska #2

input_image_lists = [ dir(sprintf('Cam00\\*.%s',img_format))'
                      dir(sprintf('Cam01\\*.%s',img_format))'
                      dir(sprintf('Cam02\\*.%s',img_format))'
                      dir(sprintf('Cam03\\*.%s',img_format))' ]';
assert(foreach_the_same_size(input_image_lists), ...
    'Input image lists are not of the same size');
for i = 1 : size(input_image_lists, 1)
    output_filename = sprintf('%s\\img%05d.%s', output_directory, i, img_format);
    fprintf('Processing and saving %s ... ', output_filename);
    output_image = rgb2gray(merge_images(input_image_lists(i,:), shift));
    imwrite(output_image, output_filename);
    disp('Done!');
end