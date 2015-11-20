class WelcomeController < ApplicationController
  before_filter :check_user

  def add_profession
    @profession = Profession.new
  end

  private

    # if user is not signed in redirect to root
    def check_user
      if !user_signed_in?
        redirect_to root_path
      end
    end
end
