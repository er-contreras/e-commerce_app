class Author < ApplicationRecord
  has_many :authors_books, dependent: :destroy
  has_many :books, through: :authors_books

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
