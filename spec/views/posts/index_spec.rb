require 'rails_helper'

RSpec.describe "posts index page", type: :feature do
    let!(:first_user) {User.first}
    let!(:users) {[first_user]}
    let!(:posts) {Post.all}

    first_user =User.create(name: 'Amanuel', photo: 'https://avatars.githubusercontent.com/u/75949338?v=4', bio: 'Game Developer with a passion for C++')

    first_post = Post.create(title: 'Programming', text: "This is a post about programming",author_id: first_user.id)
    second_post= Post.create(title: 'Robotics', text: "This is a post about Robotics",author_id: first_user.id)

    first_comment = Comment.create(post_id: first_post.id,text: 'Hi, this is my first comment.', author_id: first_user.id)

    first_like = Like.create(post_id: second_post.id, author_id: first_user.id)
   
    before do
        visit user_posts_path(users[0])
    end

    describe 'Content in post index page' do
        it 'Should display users profile picture' do
            expect(page).to have_css("img[src='#{first_user.photo}']")
        end
        it 'should display users name' do
            expect(page).to have_content(first_user.name)
        end
        it 'should display number of posts by a user' do
            expect(page).to have_content("Number of posts: #{posts.count}")
        end
        it 'should display a post title' do
            expect(page).to have_content(first_post.title)
        end
        it 'should display a post text' do
            expect(page).to have_content(first_post.text)
        end
        it 'should display first comment on a post' do 
            expect(page).to have_content(first_comment.text)
        end
        it 'should display the number of comments on a post' do
            expect(page).to have_content("Comments: #{first_post.commentsCounter}")
        end
        it 'should display the number of likes on a post' do
            expect(page).to have_content("Likes: #{first_post.likesCounter}")
        end
        it 'should have a buttion pagination' do
            expect(page).to have_button('Pagination')
        end
    end
    describe 'Links in post index page' do
        it 'when clicking on a post it should link to post show page' do
            click_link(first_post.title)
            expect(page).to have_current_path(user_post_path(users[0], posts[0]))
        end
    end
end