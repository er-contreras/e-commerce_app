class Book < ApplicationRecord
  has_many :authors_books
  has_many :authors, through: :authors_books

  belongs_to :publisher

  validates :title, length: { in: 1..255 }
  validates :publisher, presence: true
  validates :authors, presence: true
  validates :published_at, presence: true
  validates :page_count, numericality: { only_integer: true }
  validates :price, numericality: true
  validates :isbn, format: { with: /[0-9\-xX]{13}/ }
  validates :isbn, uniqueness: true
end
