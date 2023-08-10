class CreatePostRecordCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :post_record_categories do |t|
      t.integer :post_record_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
