class Category < ApplicationRecord
    
  has_many :post_records, dependent: :destroy
  
  validates :name, presence: true
end
