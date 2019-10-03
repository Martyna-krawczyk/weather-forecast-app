class ForecastsController < ApplicationController
  before_action :set_forecast, only: [:show, :edit, :update, :destroy]
  before_action :set_city
  before_action :set_state

  # GET /forecasts
  # GET /forecasts.json
  def index
    @forecasts = Forecast.order('date').select {|forecast| forecast.city_id == @city.id}
  end

  # GET /forecasts/1
  # GET /forecasts/1.json
  def show
  end

  # GET /forecasts/new
  def new
    @forecast = Forecast.new
  end

  # GET /forecasts/1/edit
  def edit
  end

  # POST /forecasts
  # POST /forecasts.json
  def create
    @forecast = Forecast.new(forecast_params)
    @forecast.city_id = @city.id

    respond_to do |format|
      if @forecast.save
        format.html { redirect_to state_city_forecast_path(@state, @forecast, @city), notice: 'Forecast was successfully created.' }
        format.json { render :show, status: :created, location: @forecast }
      else
        format.html { render :new }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forecasts/1
  # PATCH/PUT /forecasts/1.json
  def update
    respond_to do |format|
      if @forecast.update(forecast_params)
        format.html { redirect_to state_city_forecast_path(@forecast, @state, @city), notice: 'Forecast was successfully updated.' }
        format.json { render :show, status: :ok, location: @forecast }
      else
        format.html { render :edit }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forecasts/1
  # DELETE /forecasts/1.json
  def destroy
    @forecast.destroy
    respond_to do |format|
      format.html { redirect_to state_city_forecasts_path(@state, @city), notice: 'Forecast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      @forecast = Forecast.find(params[:id])
    end

    def set_city
      @city = City.find(params[:city_id])
    end

    def set_state
      @state = State.where( 'id ?', @city.state_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_params
      params.require(:forecast).permit(:min_temp, :max_temp, :short_description, :chance_of_rain, :long_description, :uv_index, :date, :possible_rainfall, :image_url, :city_id)
    end
end
