class CreateChoicesTable < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id, indexed: true, null: false
      t.text    :text, limit: 255, null: false

      t.timestamps null: false
    end
  end
end
