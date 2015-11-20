class WelcomeController < ApplicationController
  before_filter :check_user

  # GET /welcome/add_profession
  def add_profession
    if !current_user.professions.any?
      current_user.professions.build
    end
    # @profession = Profession.new
  end

  # PATCH/PUT /user
  def update_user_professions
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :add_profession
    end
  end

  private

    # if user is not signed in redirect to root
    def check_user
      if !user_signed_in?
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(professions_attributes: [:name])
    end
end
