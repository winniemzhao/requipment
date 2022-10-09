class Request < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  enum status: { pending: 0, accepted: 1, completed: 2 }

  validates :description, length: { maximum: 500, too_long: "Maximum %{count} characters allowed." }
end
