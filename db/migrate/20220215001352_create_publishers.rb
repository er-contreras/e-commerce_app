class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :name, limit: 255, null: false, unique: true
      t.timestamps
    end
  end
end
