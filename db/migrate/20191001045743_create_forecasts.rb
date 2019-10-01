class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.integer :min_temp
      t.integer :max_temp
      t.string :short_description
      t.integer :chance_of_rain
      t.text :long_description
      t.string :uv_index
      t.date :date
      t.string :possible_rainfall
      t.text :image_url
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
