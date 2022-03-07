class AddBookCoverColumn < ActiveRecord::Migration[6.1]
  def self.up
    add_column :books, :cover_image, :string
  end

  def self.down
    remove_column :books, :cover_image
  end
end
