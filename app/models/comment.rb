class Comment < ApplicationRecord
    
  belongs_to :user
  belongs_to :post_record
  
  validates :comment, presence: true
end
