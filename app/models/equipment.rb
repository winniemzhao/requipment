class Equipment < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  enum condition: { like_new: 0, gently_used: 1, moderately_used: 2, well_loved: 3, for_parts: 4 }

  validates :title, :category, :product, :population, :condition, :description, :location, presence: true
  validates :description, length: { maximum: 1000, too_long: "Maximum %{count} characters allowed." }
  validates :overall_width, :overall_height, :overall_depth, :back_height, :floor_to_seat_height, :seat_width, :seat_depth, :weight_capacity, numericality: true, allow_nil: true
end
