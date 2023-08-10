class PostRecordCategory < ApplicationRecord
    
  belongs_to :post_record
  belongs_to :category
  
end
