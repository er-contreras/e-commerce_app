class CreateAuthorsBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :authors_books do |t|
      t.references :author, null: false, foreign_key: true, index: true
      t.references :book, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
