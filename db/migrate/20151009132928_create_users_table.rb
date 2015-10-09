class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 50, indexed: true, unique: true, null: false
      t.string :password_hash, limit: 60, null: false

      t.timestamps null: false
    end
  end
end
