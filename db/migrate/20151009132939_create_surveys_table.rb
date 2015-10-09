class CreateSurveysTable < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id, indexed: true, null: false
      t.string  :name, limit: 50, indexed: true, null: false

      t.timestamps null: false
    end
  end
end
