class AddAvailabilityToPostRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :post_records, :availability, :boolean
  end
end
