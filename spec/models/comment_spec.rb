require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { User.create(name: 'Mia', bio: 'Traveler', posts_counter: 0) }
  let!(:post) do
    Post.create(title: 'Post1', text: 'This is my blog', author: user, commentsCounter: 0, likesCounter: 0)
  end
  subject { described_class.create(text: 'This is my comment', author: user, post: post) }

  describe 'associations' do
    it 'should belong to correct user' do
      expect(subject.author).to eq(user)
    end

    it 'should belong to correct post' do
      expect(subject.post).to eq(post)
    end

    it 'should update counter of related post' do
      expect(subject.post.commentsCounter).to eq(1)
    end
  end
end
