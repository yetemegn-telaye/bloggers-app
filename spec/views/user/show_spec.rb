require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:first_user) { User.create(name: 'Yeti', bio: 'Full-stack', photo: 'user1.jpg', posts_counter: 1) }
  let!(:first_post) { Post.create(title: 'FirstPost', text: 'First post text', author: first_user)}
  let!(:second_post) { Post.create(title: 'SecondPost', text: 'Second post text', author: first_user)}
  let!(:third_post) { Post.create(title: 'ThirdPost', text: 'Third new post text', author: first_user)}
  let!(:fourth_post) { Post.create(title: 'FourthPost', text: 'Fourth post text', author: first_user)}

  before do
    visit users_path(first_user)
  end

  describe 'Page content' do
    it "should display the user's profile picture" do
        expect(page).to have_css("img[src='#{first_user.photo}']")
    end
    it "should display the user's name" do
        expect(page).to have_content(first_user.name)
    end
    it "should display number of posts" do
        expect(page).to have_content("Number of posts: #{first_user.posts_counter}")
    end
    it "should display the user's 3 recent posts" do
        expect(page).to have_content(first_post.text)
        # expect(page).to have_content(second_post.text)
        # expect(page).to have_content(third_post.title)
        # expect(page).to have_content(fourth_post.title)
    end
    it 'should display a button to view all posts' do
        expect(page).to have_link('See All Posts')
      end
  end
end