class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments, inverse_of: 'post', dependent: :destroy
    has_many :likes, inverse_of: 'post', dependent: :destroy
end

def recent_five_comments
    comments.order(created_at: :desc).limit(5)
end

private
def update_post_counter
    author.increment!(:posts_count)
end