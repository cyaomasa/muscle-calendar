class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  has_many :post_records, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_post_records, through: :favorites, source: :post_record
  
  validates :name, presence: true
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  #ユーザーの検索条件
  def self.looks(word)
    @users = User.where('name LIKE ?', '%' + word + '%')
  end
  
  #いいね機能
  def favorite(post_record)
    favorites.find_or_create_by(post_record_id: post_record.id)
  end
  
  def unfavorite(post_record)
    favorites.find_by(post_record_id: post_record.id)&.destroy
  end
  
  def favorite?(post_record)
    favorite_post_records.include?(post_record)
  end
end
