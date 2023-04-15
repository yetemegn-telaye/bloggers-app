require 'rails_helper'

RSpec.describe Like, type: :model do
    let!(:user) { User.create(name: 'Mia', bio: 'I am a student', posts_counter: 0)}
    let!(:post) do
        Post.create(title: 'Post1', text: 'This is my blog', author: user, commentsCounter: 0, likesCounter: 0)
    end
    subject {described_class.create(post: post, author: user)}
    
    describe 'associations' do
        it 'should belong to correct user' do
            expect(subject.author).to eql user
        end

        it 'should belong to correct post' do
            expect(subject.post).to eql post
        end

        it 'should update couner of related post' do
            expect(subject.post.likesCounter).to eql 1
        end
    end
end