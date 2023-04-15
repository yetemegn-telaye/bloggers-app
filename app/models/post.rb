class Post < ApplicationRecord
  after_save :update_post_counter
  belongs_to :author, class_name: 'User'
  has_many :comments, inverse_of: 'post', dependent: :destroy
  has_many :likes, inverse_of: 'post', dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
