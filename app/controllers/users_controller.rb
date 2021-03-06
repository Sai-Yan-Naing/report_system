class UsersController < ApplicationController
  def index
    if logged_in?
      # @users = User.all
      @pagy, @users = pagy(User.all, items: 10)
    else
      render 'new'
      end
  end
  def show
    # if logged_in?
    @user = User.find(params[:id])
  end
  def new
    if logged_in?
  	   @user = User.new
    else
      redirect_to root_path
    end
  end
  def edit
    if logged_in?
       @user = User.find(params[:id])
    else
      redirect_to root_path
    end
    # @user = User.find(params[:id])
  end
  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)

    # build a photo and pass it into a block to set other attributes
    # @user = User.new(params[:photo]) do |t|
    #   if params[:photo][:data]
    #     t.data      = params[:photo][:data].read
    #     t.filename  = params[:photo][:data].original_filename
    #     t.mime_type = params[:photo][:data].content_type
    #   end
    # end

    if @user.save
      # redirect_to @user
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to @user
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:department,:team,:picture, :password,:password_confirmation)
  end
end
