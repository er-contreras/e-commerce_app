class Book < ApplicationRecord
  has_many :authors_books, dependent: :destroy
  has_many :authors, through: :authors_books

  belongs_to :publisher

  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title]
  pg_search_scope :search_by_authors, associated_against: {
    authors: %i[first_name last_name]
  }
  # multisearchable against: [:title]
  # PgSearch::Multisearch.rebuild(Book, clean_up: false)

  has_one_attached :cover_image

  validates :title, length: { in: 1..255 }
  validates :publisher, presence: true
  validates :authors, presence: true
  validates :published_at, presence: true
  validates :page_count, numericality: { only_integer: true }
  validates :price, numericality: true
  validates :isbn, format: { with: /[0-9\-xX]{13}/ }
  validates :isbn, uniqueness: true

  def author_names
    authors.map(&:name).join(', ')
  rescue StandardError
    ''
  end
end
