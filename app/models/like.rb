class Like < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post
end

private
def update_likes_counter
    post.increment!(:likes_count)
end