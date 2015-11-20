class WelcomeController < ApplicationController
  before_filter :check_user

  # GET /welcome/add_profession
  def add_profession
    if !current_user.professions.any?
      current_user.professions.build
    end
  end

  private

    # if user is not signed in redirect to root
    def check_user
      if !user_signed_in?
        redirect_to root_path
      end
    end

end
