class Category < ApplicationRecord
    
  has_many :post_record, dependent: :destroy
  
  validates :name, presence: true
end
