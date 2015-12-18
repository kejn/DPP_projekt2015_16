output_directory = 'Cam';
img_format = 'bmp';

input_image_lists = [ dir(sprintf('Cam00\\*.%s',img_format))'
                      dir(sprintf('Cam01\\*.%s',img_format))'
                      dir(sprintf('Cam02\\*.%s',img_format))'
                      dir(sprintf('Cam03\\*.%s',img_format))' ]';
assert(foreach_the_same_size(input_image_lists), ...
    'Input image lists are not of the same size');
for i = 1 : size(input_image_lists, 1)
    output_filename = sprintf('%s\\img%05d.%s', output_directory, i, img_format);
    fprintf('Saving %s ... ', output_filename);
    output_image = merge_images(input_image_lists(i,:));
    imwrite(output_image, output_filename);
    disp('Saved!');
end