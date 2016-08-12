require 'digest/md5'

class VisitorsController < ApplicationController
  before_filter :check_session

  def check_session
    if !session[:user_email]
      redirect_to signin_path
    end
  end

  def index
      @title = 'User | Table'
      cookies[:create_new] = 0;
      @user = User.find_by_email(session[:user_email])
      @user_list = User.all
  end

  def profile
      @title = 'User | Profile'
      @user = User.find_by_email(session[:user_email])
  end

end
