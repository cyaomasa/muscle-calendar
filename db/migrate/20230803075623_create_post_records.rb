class CreatePostRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :post_records do |t|
      t.string :training_name, null: false
      t.integer :set_count, null: false
      t.integer :weight, null: false
      t.integer :rep_count, null: false
      t.integer :user_id, null: false
      t.datetime :start_time, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
