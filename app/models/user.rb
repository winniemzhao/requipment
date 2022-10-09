class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo, dependent: :destroy
  has_many :equipment, dependent: :destroy
  has_many :requests

  validates :email, format: { with: /\A.*@.*\.com\z/, message: "Please enter a valid email address." }, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, length: { maximum: 1000, too_long: "Maximum %{count} characters allowed." }
end
