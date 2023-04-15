require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { User.create(name: 'Mia', bio: 'I am a student', posts_counter: 0) }
  subject do
    described_class.new(title: 'Post1', text: 'This is my blog', author: user, commentsCounter: 0, likesCounter: 0)
  end
  before { subject.save }

  describe 'validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'should not be valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid if :title is longer than 250' do
      subject.title = 'A' * 251
      expect(subject).to_not be_valid
    end
    it 'should not be valid if :likesCounter is less than 0' do
      subject.likesCounter = -1
      expect(subject).to_not be_valid
    end
    it 'should not be valid if :likes_counter is not an integer' do
      subject.likesCounter = 1.5
      expect(subject).to_not be_valid
    end
    it 'should not be valid if :comments_counter is less than 0' do
      subject.commentsCounter = -1
      expect(subject).to_not be_valid
    end
    it 'should not be valid if :comments_counter is not an integer' do
      subject.commentsCounter = 1.5
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should belong to correct user' do
      expect(subject.author).to eq(user)
    end

    it 'should update counter of related user' do
      expect(subject.author.posts_counter).to eq(1)
    end
  end

  describe '#recent_comments' do
    before do
      6.times do |i|
        Comment.create(text: "Comment#{i + 1}", post: subject, author: user)
      end
    end
    it 'should return 5 most recent comments' do
      expect(subject.recent_five_comments.length).to eql 5
    end
    it 'should return most recent one as first item' do
      expect(subject.recent_five_comments.first.text).to eql 'Comment6'
    end
  end
end
