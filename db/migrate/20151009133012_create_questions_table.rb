class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id, indexed: true, null: false
      t.string  :text, limit: 511, indexed: true, null: false

      t.timestamps null: false
    end
  end
end
