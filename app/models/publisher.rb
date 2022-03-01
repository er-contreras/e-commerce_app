class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, length: { in: 2..255 }
  validates :name, uniqueness: true
end
