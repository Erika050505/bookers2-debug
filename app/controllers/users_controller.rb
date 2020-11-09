class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show,:edit,:index,:update]
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @user = User.new
    @users = User.all
    @book = Book.new
    @followings = @user.followings
    @followers = @user.followers
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  #def following
  #    @user  = User.find(params[:id])
   #   @users = @user.followings
    #  render 'show_followings'
  #end

  #def followers
  #  @user  = User.find(params[:id])
  #  @users = @user.followers
  #  render 'show_followers'
  #end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
    end
  end
end