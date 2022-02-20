class CreateAuthorsBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :authors_books do |t|
      t.references :author, null: false, foreign_key: true, index: true, default: false
      t.references :book, null: false, foreign_key: true, index: true, default: false
      t.timestamps
    end
  end
end
