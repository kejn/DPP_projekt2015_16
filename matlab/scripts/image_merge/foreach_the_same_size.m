function [ result ] = foreach_the_same_size( input_image_lists )
%FOREACH_THE_SAME_SIZE Check if input_image_lists are of the same size.

    input_list_number = 1;
    for image_list = input_image_lists
        if size(image_list,1) == 1
            error('Input image list#%d is not horizontal', input_list_number);
        end
        input_list_number = input_list_number + 1;
    end
    result = size(input_image_lists(1),2) == size(input_image_lists(2),2) ...
        == size(input_image_lists(3),2) == size(input_image_lists(4),2);
end

