class City < ApplicationRecord
  searchkick word_start: [:name]

  has_many :reports
  has_many :users
  validates :name, presence: true, allow_blank: false
  validates :zip_code, presence: true, allow_blank: false
  validates :insee_code, presence: true, allow_blank: false
  validates :city_latitude, presence: true, allow_blank: true
  validates :city_longitude, presence: true, allow_blank: true
end
