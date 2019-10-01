json.extract! forecast, :id, :min_temp, :max_temp, :short_description, :chance_of_rain, :long_description, :uv_index, :date, :possible_rainfall, :image_url, :city_id, :created_at, :updated_at
json.url forecast_url(forecast, format: :json)
