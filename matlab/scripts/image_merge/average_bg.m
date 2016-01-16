input_directory = 'Cam';
img_format = 'png';

image_numbers = 1:24; % dla stanowiska #1
%image_numbers = [26:61 81:98 102 110:124 128 134:147 156:167 176:184 189 200:203]; % dla stanowiska #2
input_images = [];
for i = image_numbers
    input_images = [input_images ...
        dir(sprintf('%s\\img%05d.%s',input_directory,i,img_format))];
end

images = [];
i = 1;
for file = input_images
    fprintf('Reading %s\n', file.name);
    images{i} = imread(sprintf('%s\\%s', input_directory, file.name));
    i = i+1;
end

output_filename = sprintf('img_bg_avrg.%s',img_format);
fprintf('Processing %s ... ', output_filename);
output_image = average_image(images);
fprintf('Saving ... ');
imwrite(output_image, output_filename);
disp('Done!');
imshow(output_image);