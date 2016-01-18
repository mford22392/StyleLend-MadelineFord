class ResizersController < ApplicationController

  def show
    resizer = Resizer.new(resizer_params)
    scaled_dimensions = resizer.new_dimensions
    bounding_box = params[:bounding_box_dimensions]
    render json: {scaled_dimensions: scaled_dimensions, bounding_box: bounding_box }
  end

  def resizer_params
    params.require(:resizer).permit(:image_dimensions, :bounding_box)
  end
end
