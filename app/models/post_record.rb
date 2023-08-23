class PostRecord < ApplicationRecord
    
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :training_name, presence: true
  validates :set_count, presence: true
  validates :weight, presence: true
  validates :rep_count, presence: true
  validates :start_time, presence: true
  validates :availability, inclusion: { in: [true, false] }
  
  # 投稿数記録の分岐
  scope :created_this_week, -> { where(start_time: Time.current.all_week) }
  scope :created_last_week, -> { where(start_time: Time.current.last_week.all_week) }
  scope :created_this_month, -> { where(start_time: Time.current.all_month) }
  scope :created_last_month, -> { where(start_time: Time.current.last_month.all_month) }
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.looks(word)
    @post_records = PostRecord.where('training_name LIKE ?', '%' + word + '%')
  end
end
