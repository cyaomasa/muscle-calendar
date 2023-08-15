class PostRecord < ApplicationRecord
    
  belongs_to :user
  belongs_to :category, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :training_name, presence: true
  validates :set_count, presence: true
  validates :weight, presence: true
  validates :rep_count, presence: true
  validates :start_time, presence: true
  validates :availability, inclusion: { in: [true, false] }
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.looks(word)
    @post_records = PostRecord.where('training_name LIKE ?', '%' + word + '%')
  end
    
end
