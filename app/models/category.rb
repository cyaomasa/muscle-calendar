class Category < ApplicationRecord
    
  has_many :post_record_categories
  has_many :post_records, through: :post_record_categories
  
  validates :name, presence: true
end
