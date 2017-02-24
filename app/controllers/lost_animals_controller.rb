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
  end

  # GET /lost_animals/1/edit
  def edit
  end

  # POST /lost_animals
  # POST /lost_animals.json
  def create
    @lost_animal = LostAnimal.new(lost_animal_params)

    respond_to do |format|
      if @lost_animal.save
        format.html { redirect_to @lost_animal, notice: 'Lost animal was successfully created.' }
        format.json { render :show, status: :created, location: @lost_animal }
      else
        format.html { render :new }
        format.json { render json: @lost_animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lost_animals/1
  # PATCH/PUT /lost_animals/1.json
  def update
    respond_to do |format|
      if @lost_animal.update(lost_animal_params)
        format.html { redirect_to @lost_animal, notice: 'Lost animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @lost_animal }
      else
        format.html { render :edit }
        format.json { render json: @lost_animal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost_animal
      @lost_animal = LostAnimal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lost_animal_params
      params.require(:lost_animal).permit(:name, :owner, :owner_email, :description, :city_id, photos: [])
    end
end
