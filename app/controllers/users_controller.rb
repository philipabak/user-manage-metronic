require 'digest/md5'

class UsersController < ApplicationController
  # before_filter :skip_first_page, only: :index

  def signup
      @title = 'User | Sign Up'
      if session[:user_email]
        @user = User.find_by_email(session[:user_email])
      end

  end

  def create
      @title = 'User | Create'
      cookies[:create_new] = 1;
      @user = User.find_by_email(session[:user_email])
      render 'users/signup'

  end

  def do_signup
    @user = User.new(user_params)
    @user.password = Digest::MD5.hexdigest(params[:password])

    if @user.save
      flash[:notice_type]    = 'success'
      flash[:notice_content] = 'Account has registered successfully.'
    else
      flash[:notice_type]    = 'danger'
      flash[:notice_content]  = 'Something went wrong!'
      redirect_to root_path
    end

    if cookies[:create_new] != 1
      session[:user_email] = @user.email
      cookies[:create_new] = 0
    end
    redirect_to root_path

  end

  def signin
    if session[:user_email]
      redirect_to root_path
    else
      @title = 'User | Sign In'
    end
  end

  def do_signin
    email = params[:email]
    password = Digest::MD5.hexdigest(params[:password])
    location = params[:location]
    @user = User.where(:email => email, :password => password, :location => location).first
    if @user.nil?
      flash[:notice_type]    = 'danger'
      flash[:notice_content]  = 'Invalid email or password'

      redirect_to root_path
    else
      flash[:notice_type]    = 'success'
      flash[:notice_content]  = 'You are now signed in.'

      session[:user_email] = @user.email
      cookies[:create_new] = 0
      redirect_to root_path
    end
  end

  def signout
    session.delete(:user_email)

    flash[:notice_type]    = 'success'
    flash[:notice_content]  = 'You are now signed out.'
    redirect_to root_path
  end

  def check_user
    email = params[:email]
    password = Digest::MD5.hexdigest(params[:password])
    location = params[:location]
    @user = User.where(:email => email, :password => password, :location => location).first
    if @user.nil?
      @user = User.new
      @user.email = 'null'
    end
    render json: @user
  end

  def check_email
    email = params[:email]
    @user = User.find_by_email(email)
    if @user.nil?
      @user = User.new
      @user.email = 'null'
    end
    render json: @user
  end

  def user_params
    params.permit(:email, :name, :phone, :location, :party_size)
  end


end
