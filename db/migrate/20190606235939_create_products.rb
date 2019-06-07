class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.decimal :price, precision: 24, scale: 4, default: 0.0
      t.references :user, foreign_key: true

      t.timestamps

      t.index :title
      t.index :price
    end
  end
end
