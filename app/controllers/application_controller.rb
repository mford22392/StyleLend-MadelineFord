class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from StandardError do |e|
    error(e)
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end


  private 


  def error(e)
    error_info = {
      :error => "internal-server-error",
      :exception => "#{e.class.name}",
      :notice => "ensure your request is in the format https://mfstylelend.herokuapp.com/api/v1/resizers?image_dimensions=[w,h]&bounding_box=[w,h]"
    }
    error_info[:trace] = e.backtrace[0,10] if Rails.env.development?
    render :json => error_info.to_json, :status => 500

  end

end
