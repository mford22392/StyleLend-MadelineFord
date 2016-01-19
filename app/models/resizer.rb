class Resizer < ActiveRecord::Base

  attr_accessor :sets_of_dimensions, :bounding_box_width, :bounding_box_height

  def new_dimensions
    collect_data

    new_dimensions = @sets_of_dimensions.each_with_object([]) do |set, array|
      array << self.scale(set)
    end
    new_dimensions.flatten!
  end

  def collect_data
    array_image_dimensions = JSON.parse(self.image_dimensions)
    array_bounding_box = JSON.parse(self.bounding_box)

    @sets_of_dimensions = array_image_dimensions.each_slice(2).to_a
    @bounding_box_width = array_bounding_box[0].to_f
    @bounding_box_height = array_bounding_box[1].to_f
  end

  def scale(dimensions)
    old_width = dimensions[0].to_f
    old_height = dimensions[1].to_f

    ratio_by_width = old_width/@bounding_box_width
    scaled_height = old_height/ratio_by_width

    ratio_by_height = old_height/@bounding_box_height
    scaled_width = old_width/ratio_by_height

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
