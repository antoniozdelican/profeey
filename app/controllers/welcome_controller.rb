class WelcomeController < ApplicationController
  before_filter :check_user

  # GET /welcome/add_profession
  def add_profession
    @user = current_user
    if !@user.professions.any?
      @user.professions.build
    end
  end

  # GET /welcome/add_profile_pic
  def add_profile_pic
    @user = current_user
  end

  # GET /welcome/add_interests
  def add_interests
    
  end

  # GET /welcome/follow_people
  def follow_people
    
  end

  private

    # if user is not signed in redirect to root
    def check_user
      if !user_signed_in?
        redirect_to root_path
      end
    end

end
