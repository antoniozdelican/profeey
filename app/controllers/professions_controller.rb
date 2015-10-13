class ProfessionsController < ApplicationController

  def index
    # names = Array.new
    @professions = Profession.all
    #@professions = Profession.search(params[:query], autocomplete: true, limit: 10).map do |profession|
    #    { name: profession.name, id: profession.id }
    #end
    # @professions = Profession.search(params[:query], autocomplete: true, limit: 10).map(&:name)
    # @professions = Profession.where('name like ?', '#{params[:query]}%')
    # @professions.each { |x| names << x.name}
    # render json: names
    # render json: %w[foo bar banana glepa zdela ajoj mama tata sine brat buraz]
    render json: @professions
    # render json: Model.where(name: params[:query])
  end
end
