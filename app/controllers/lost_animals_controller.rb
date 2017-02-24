class LostAnimalsController < ApplicationController
  before_action :set_lost_animal, only: [:show, :edit, :update]

  # GET /lost_animals/1
  # GET /lost_animals/1.json
  def show
    #show a specific animal with description and owner detials
  end

  # GET /lost_animals/new
  def new
    #add an animal to the city
    @lost_animal = LostAnimal.new
    @city = City.find(params[:city_id])
    @lost_animal.city = @city
  end

  # POST /lost_animals
  # POST /lost_animals.json
  def create
    @lost_animal = LostAnimal.new(lost_animal_params)
    @city = City.find(params[:city_id])
    @lost_animal.city = @city
    respond_to do |format|
      if @lost_animal.save
        format.html { redirect_to @city, notice: 'Lost animal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost_animal
      @lost_animal = LostAnimal.where(city_id: params[:city_id], id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lost_animal_params
      params.require(:lost_animal).permit(:name, :owner, :owner_email, :description, :city_id, photos: [])
    end
end
