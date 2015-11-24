class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:followers, :following]
  
  def show
    @user = User.find(params[:id])
    @professions = @user.professions
    # @things = @user.things.paginate(page: params[:page])
    @things = @user.things
  end

  # PATCH/PUT //update_user_professions
  def update_user_professions
    @user = current_user
    if @user.update(user_params)
      redirect_to welcome_add_profile_pic_path
    else
      render 'welcome/add_profession'
    end
  end

  # PATCH/PUT //update_user_profile_pic
  def update_user_profile_pic
    @user = current_user
    if @user.update(user_params)
      redirect_to welcome_add_interests_path
    else
      render 'welcome/add_profile_pic'
    end
  end

  # GET /users/:id/followers
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    # @users = @user.followers.paginate(page: params[:page])
    @users = @user.followers
    render 'show_follow'
  end

  # GET /users/:id/following
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    # @users = @user.following.paginate(page: params[:page])
    @users = @user.following
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:profile_pic, :crop_x, :crop_y, :crop_ratio, professions_attributes: [:id, :name])
    end
end
