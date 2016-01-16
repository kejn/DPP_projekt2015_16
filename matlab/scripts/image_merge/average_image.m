function [ output_image ] = average_image( images )
%AVERAGE_IMAGE return average image based on array cell of input images
output_image = im2double(images{1});
for i = 2: size(images,2)        
    output_image = output_image + im2double(images{i});
end
output_image = uint8(output_image .* 255 ./ size(images,2));

end

