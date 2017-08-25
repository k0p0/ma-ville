class Report < ApplicationRecord
  belongs_to :degradation
  belongs_to :furniture
  belongs_to :city
  belongs_to :priority
  belongs_to :status
  has_attachment :picture
  has_many :messages
  validates :submit_date, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  # validates :report_latitude, presence: true, allow_blank: false
  # validates :report_longitude, presence: true, allow_blank: false

  geocoded_by :address, :latitude  => :report_latitude, :longitude => :report_longitude
  after_validation :geocode, if: :address_changed?

end
