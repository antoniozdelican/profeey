class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @professions = @user.professions
  end

  # PATCH/PUT /user
  def update_user_professions
    if current_user.update(user_params)
      redirect_to welcome_add_profile_pic_path
    else
      render 'welcome/add_profession'
    end
  end

  def update_user_profile_pic
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'welcome/add_profile_pic'
    end
  end

  private

    def user_params
      params.require(:user).permit(:profile_pic, :crop_x, :crop_y, :crop_w, :crop_h, :crop_ratio, professions_attributes: [:id, :name])
    end
end
