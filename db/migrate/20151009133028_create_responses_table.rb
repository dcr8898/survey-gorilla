class CreateResponsesTable < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :poll_id, indexed: true, null: false
      t.integer :choice_id, indexed: true, null: false

      t.timestamps null: false
    end
  end
end
