require 'test_helper'

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forecast = forecasts(:one)
  end

  test "should get index" do
    get forecasts_url
    assert_response :success
  end

  test "should get new" do
    get new_forecast_url
    assert_response :success
  end

  test "should create forecast" do
    assert_difference('Forecast.count') do
      post forecasts_url, params: { forecast: { chance_of_rain: @forecast.chance_of_rain, city_id: @forecast.city_id, date: @forecast.date, image_url: @forecast.image_url, long_description: @forecast.long_description, max_temp: @forecast.max_temp, min_temp: @forecast.min_temp, possible_rainfall: @forecast.possible_rainfall, short_description: @forecast.short_description, uv_index: @forecast.uv_index } }
    end

    assert_redirected_to forecast_url(Forecast.last)
  end

  test "should show forecast" do
    get forecast_url(@forecast)
    assert_response :success
  end

  test "should get edit" do
    get edit_forecast_url(@forecast)
    assert_response :success
  end

  test "should update forecast" do
    patch forecast_url(@forecast), params: { forecast: { chance_of_rain: @forecast.chance_of_rain, city_id: @forecast.city_id, date: @forecast.date, image_url: @forecast.image_url, long_description: @forecast.long_description, max_temp: @forecast.max_temp, min_temp: @forecast.min_temp, possible_rainfall: @forecast.possible_rainfall, short_description: @forecast.short_description, uv_index: @forecast.uv_index } }
    assert_redirected_to forecast_url(@forecast)
  end

  test "should destroy forecast" do
    assert_difference('Forecast.count', -1) do
      delete forecast_url(@forecast)
    end

    assert_redirected_to forecasts_url
  end
end
