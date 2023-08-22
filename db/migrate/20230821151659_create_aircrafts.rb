class CreateAircrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :aircrafts do |t|
      t.string :model
      t.text :description
      t.integer :capacity
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
