require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Tatiana', bio: 'I am a software developer', posts_counter: 0) }

  before { subject.save }

  context 'validating :name' do
    it 'should be valid if not present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid if unique' do
      expect(subject).to be_valid
    end

    it 'should be valid if not unique' do
      User.create(name: 'Tats', bio: 'I am a software developer', posts_counter: 3)
      subject.name = 'tats'
      expect(subject).to_not be_valid
    end
  end

  context 'validating :posts_counter' do
    it 'should not valid if less than 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should not valid if not integer' do
      subject.posts_counter = 1.5
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_posts' do
    before do
      4.times do |i|
        Post.create(title: "Post#{i + 1}", author: subject, commentsCounter: 0, likesCounter: 0)
      end
    end
    it 'should return 3 most recent posts' do
      expect(subject.recent_posts.length).to eql 3
    end

    it 'should return most recent one as first item' do
      expect(subject.recent_posts.first.title).to eql 'Post4'
    end
  end
end
