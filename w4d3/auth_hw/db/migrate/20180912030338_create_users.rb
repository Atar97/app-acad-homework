class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session, null: false

      t.timestamps
    end
    add_index :users, :session, unique: true
  end
end