class FixUpColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:forecasts, :min_temp, false)
    change_column_null(:forecasts, :max_temp, false)
    change_column_null(:forecasts, :short_description, false)
    change_column_null(:forecasts, :chance_of_rain, false)
    change_column_null(:forecasts, :long_description, false)
    change_column_null(:forecasts, :date, false)
    change_column_null(:forecasts, :image_url, false)
    change_column(:forecasts, :min_temp, :integer, :default => 0)
    change_column(:forecasts, :max_temp, :integer, :default => 0)
    change_column(:forecasts, :chance_of_rain, :integer, :default => 0)
    change_column_null(:cities, :name, false)
    change_column_null(:states, :name, false)
  end
end
