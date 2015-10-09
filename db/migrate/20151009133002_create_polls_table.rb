class CreatePollsTable < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :user_id, indexed: true, null: false
      t.integer :survey_id, indexed: true, null: false

      t.timestamps null: false
    end
  end
end
