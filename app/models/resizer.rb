class Resizer < ActiveRecord::Base

  attr_accessor :sets_of_dimensions, :bounding_box_width, :bounding_box_height

  def new_dimensions
    collect_data

    @sets_of_dimensions.each_with_object([]) do |set, array|
      array << self.scale(set)
    end.flatten!

  end

  def collect_data
    # Creates an array of arrays containing the sets of image dimensions and sets the bounding box width and height as instance variables: 
    
    array_image_dimensions = JSON.parse(self.image_dimensions)
    array_bounding_box = JSON.parse(self.bounding_box)

    @sets_of_dimensions = array_image_dimensions.each_slice(2).to_a
    @bounding_box_width = array_bounding_box[0].to_f
    @bounding_box_height = array_bounding_box[1].to_f
  end

  def scale(dimensions)
    old_width = dimensions[0].to_f
    old_height = dimensions[1].to_f

    # First, determine what the scaled height would be based on bounding box width

    ratio_by_width = old_width/@bounding_box_width
    scaled_height = old_height/ratio_by_width

    # and what the scaled width would be based on bounding box height.

    ratio_by_height = old_height/@bounding_box_height
    scaled_width = old_width/ratio_by_height

    # If the scaled height is too big for the bounding box, you know the new height is the bounding box height and the new width is the scaled width calculated above, and vice versa:  

    if scaled_height > @bounding_box_height
      new_width = scaled_width
      new_height = @bounding_box_height
    else
      new_height = scaled_height
      new_width = @bounding_box_width
    end

    [new_width.to_i, new_height.to_i]
  end

end
