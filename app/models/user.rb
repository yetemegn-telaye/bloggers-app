class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  has_many :posts, foreign_key: 'author_id', inverse_of: 'author', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', inverse_of: 'author', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', inverse_of: 'author', dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
