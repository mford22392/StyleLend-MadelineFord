class Api::V1::ResizersController < ApplicationController

  def index
    resizer = Resizer.create(resizer_params)
    scaled_dimensions = resizer.new_dimensions
    bounding_box = JSON.parse(params[:bounding_box])
    render json: {scaled_dimensions: scaled_dimensions, bounding_box: bounding_box }
  end

  def resizer_params
    params.permit(:image_dimensions, :bounding_box)
  end
end
