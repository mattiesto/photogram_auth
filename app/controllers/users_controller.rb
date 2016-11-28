class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
    @comments = @user.comments

    render("users/show.html.erb")
  end

  def likes
    @user = current_user
    @likes = @user.likes

    render("users/my_likes.html.erb")
  end
end
