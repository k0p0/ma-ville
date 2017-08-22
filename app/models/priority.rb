class Priority < ApplicationRecord
  has_many :reports
  validates :name, presence: true, allow_blank: false, uniqueness: true
end
