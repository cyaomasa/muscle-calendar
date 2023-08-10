class PostRecord < ApplicationRecord
    
  belongs_to :user
  #belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :training_name, presence: true
  validates :set_count, presence: true
  validates :weight, presence: true
  validates :rep_count, presence: true
  validates :availability, inclusion: { in: [true, false] }
    
  #def favorited_by?(user)
    #favorites.exists?(user_id: user.id)
  #end
    
end
