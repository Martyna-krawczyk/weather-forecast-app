class City < ApplicationRecord
  has_many :forecasts
  belongs_to :state
end
