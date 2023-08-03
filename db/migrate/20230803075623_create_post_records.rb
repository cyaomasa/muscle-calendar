class CreatePostRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :post_records do |t|
      t.string :training_name
      t.integer :set_count
      t.integer :weight
      t.integer :rep_count

      t.timestamps
    end
  end
end
