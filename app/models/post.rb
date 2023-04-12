class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments, inverse_of: 'post', dependent: :destroy
    has_many :likes, inverse_of: 'post', dependent: :destroy
end
