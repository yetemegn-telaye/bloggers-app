require 'rails_helper'

RSpec.describe "posts index", type: :feature do
    let!(:first_user) {User.first}
    let!(:users) {[first_user]}
    let!(:posts) {Post.all}

    first_user =User.create(name: 'Amanuel', photo: 'https://avatars.githubusercontent.com/u/75949338?v=4', bio: 'Game Developer with a passion for C++')

    first_post = Post.create(title: 'Programming', text: "This is a post about programming",author_id: first_user.id)
    second_post= Post.create(title: 'Robotics', text: "This is a post about Robotics",author_id: first_user.id)

    first_comment = Comment.create(post_id: first_post.id,text: 'Hi, this is my first comment.', author_id: first_user.id)

    first_like = Like.create(post_id: second_post.id, author_id: first_user.id)
   
    before do
        visit user_posts_path(users.id)
    end

    describe 'Content in post index page' do
        it 'Should display users profile picture' do
            expect(page).to have_css("img[src='#{first_user.photo}']")
        end
    end
end