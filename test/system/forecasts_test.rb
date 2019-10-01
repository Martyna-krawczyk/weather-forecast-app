require "application_system_test_case"

class ForecastsTest < ApplicationSystemTestCase
  setup do
    @forecast = forecasts(:one)
  end

  test "visiting the index" do
    visit forecasts_url
    assert_selector "h1", text: "Forecasts"
  end

  test "creating a Forecast" do
    visit forecasts_url
    click_on "New Forecast"

    fill_in "Chance of rain", with: @forecast.chance_of_rain
    fill_in "City", with: @forecast.city_id
    fill_in "Date", with: @forecast.date
    fill_in "Image url", with: @forecast.image_url
    fill_in "Long description", with: @forecast.long_description
    fill_in "Max temp", with: @forecast.max_temp
    fill_in "Min temp", with: @forecast.min_temp
    fill_in "Possible rainfall", with: @forecast.possible_rainfall
    fill_in "Short description", with: @forecast.short_description
    fill_in "Uv index", with: @forecast.uv_index
    click_on "Create Forecast"

    assert_text "Forecast was successfully created"
    click_on "Back"
  end

  test "updating a Forecast" do
    visit forecasts_url
    click_on "Edit", match: :first

    fill_in "Chance of rain", with: @forecast.chance_of_rain
    fill_in "City", with: @forecast.city_id
    fill_in "Date", with: @forecast.date
    fill_in "Image url", with: @forecast.image_url
    fill_in "Long description", with: @forecast.long_description
    fill_in "Max temp", with: @forecast.max_temp
    fill_in "Min temp", with: @forecast.min_temp
    fill_in "Possible rainfall", with: @forecast.possible_rainfall
    fill_in "Short description", with: @forecast.short_description
    fill_in "Uv index", with: @forecast.uv_index
    click_on "Update Forecast"

    assert_text "Forecast was successfully updated"
    click_on "Back"
  end

  test "destroying a Forecast" do
    visit forecasts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forecast was successfully destroyed"
  end
end
