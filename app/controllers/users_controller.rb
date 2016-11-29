class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def users_like
    @like = Like.new
    @like.user_id = current_user.id
    @like.photo_id = params[:id]
    @like.save

    redirect_to("/users/"+current_user.id.to_s)
  end

  def users_unlike
    @like = Like.where(:user_id => current_user.id, :photo_id => params[:id])
    @like.destroy_all

    redirect_to("/users/"+current_user.id.to_s)
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos

    render("users/show.html.erb")
  end

  def likes
    @user = current_user
    @likes = @user.likes

    render("users/my_likes.html.erb")
  end
end
