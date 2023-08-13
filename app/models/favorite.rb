class Favorite < ApplicationRecord
    
  belongs_to :user
  belongs_to :post_record
  
  validates_uniqueness_of :post_record_id, scope: :user_id
    
end
