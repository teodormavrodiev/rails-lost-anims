class CitiesController < ApplicationController
  before_action :set_city, only: [:show]

  # GET /cities
  # GET /cities.json
  def index
    #show home page - top three cities by animals, as well as option to select a city to filter
    #inside of the banner
    if params[:name]
      name = params[:name].strip.titleize
      @city = City.where(name: name).first
      if @city
        redirect_to @city
      else
        redirect_to cities_path, notice: 'City not found.'
      end
    else
      @cities = City.all
    end
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    #show animals that are lost in that city - picture as well as name
  end

  # GET /cities/new
  def new
    #add a new city to the cities list
    @city = City.new
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :photo)
    end
end
