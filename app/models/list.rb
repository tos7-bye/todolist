class List < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_many :cards, dependent: :destroy

  validates :user_id, presence: true
  validates :title, length: { in: 1..255 }

end
