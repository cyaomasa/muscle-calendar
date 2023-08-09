class CreatePostRecordCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :post_record_collections do |t|

      t.timestamps
    end
  end
end
