class CreateVisitsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :num_visits, null: false, default: 0
      t.integer :user_id, null: false
      t.integer :short_id, null: false
      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :short_id
  end
end
