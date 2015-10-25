class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @professions = @user.professions
  end
end
