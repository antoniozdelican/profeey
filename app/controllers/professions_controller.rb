class ProfessionsController < ApplicationController

  def index
    @professions = Profession.all
    render json: @professions
  end
end
