class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  belongs_to :city
  # validates :email, presence: true, allow_blank: false
  # validates :encrypted_password, presence: true, allow_blank: false
end
