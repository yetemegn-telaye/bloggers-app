require 'rails_helper'

RSpec.describe "posts show page", type: :feature do
    let!(:user) { User.create(name: 'Tati', bio: 'Student', photo: 'https://avatars.githubusercontent.com/u/80094659?v=4')}
    let!(:post) { Post.create(title: 'The fisrt post', text: 'Content for post 1', author: user) }
    let!(:comment) {Comment.create( author: user,  text: 'Hi, this is my first comment.',post: post)}
    let!(:likes) { Like.create(author: user, post: post) }
    
    before do
      visit user_posts_path(user, post)
    end
    describe "Content in post show page" do
        it 'should display posts title' do
            expect(page).to have_content(post.title)
        end
        it 'should display a posts author' do
            expect(page).to have_content(post.author.name)
        end
        it 'should isplay the number of comments on a post' do
            expect(page).to have_content("Comments: #{post.commentsCounter}")
        end
        it 'should display the number of likes on a post' do
            expect(page).to have_content("Likes: #{post.likesCounter}")
        end
        it 'should display a post text' do
            expect(page).to have_content(post.text)
        end
        it 'should display author of each comment' do 
            expect(page).to have_content(comment.author.name)
        end
        it 'should display the text of each comment' do
            expect(page).to have_content(comment.text)
        end
    end
end