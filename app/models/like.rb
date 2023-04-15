class Like < ApplicationRecord
  after_save :update_likes_counter
  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_likes_counter
    post.increment!(:likesCounter)
  end
end
