class Publisher < ApplicationRecord
  validates :name, length: { in: 2..255 }
  validates :name, uniqueness: true
end
