class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

#  before_filter :ref_to_session

  #called by last route matching unmatched routes.  Raises RoutingError which will be rescued from in the same way as other exceptions.
  def raise_not_found!
    # render 'visitors/404'
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end

end
