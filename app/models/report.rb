class Report < ApplicationRecord
  belongs_to :degradation
  belongs_to :furniture
  belongs_to :city
  belongs_to :priority
  belongs_to :status
  has_many :messages
  validates :submit_date, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :report_latitude, presence: true, allow_blank: false
  validates :report_longitude, presence: true, allow_blank: false
end
