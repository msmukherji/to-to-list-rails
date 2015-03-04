class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  def home
    if current_user
      @lists = current_user.to_do_lists
    end
  end
end
