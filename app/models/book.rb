class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  belongs_to :publisher

  validates :title, length: { in: 1..255 }
  validates :publisher, :authors, :published_at, presence: true
  validates :page_count, numericality: { only_integer: true }
  validates :price, numericality: true
  validates :isbn, format: { with: /[0-9\-xX]{13}/ }
  validates :isbn, uniqueness: true
end
