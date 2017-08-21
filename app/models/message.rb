class Message < ApplicationRecord
  belongs_to :report, dependent: :destroy
  belongs_to :user
  validates :submit_message_date, presence: true, allow_blank: false
  validates :note, presence: true, allow_blank: false
end
