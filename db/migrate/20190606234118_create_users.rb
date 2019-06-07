class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps

      t.index :username
      t.index :email
    end
  end
end
