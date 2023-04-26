require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  let!(:first_user) { User.create(name: 'Yetemegn', bio: 'Full-stack Developer', photo: 'my_profile.jpg') }
  let!(:first_post) { Post.create(title: 'First Post', text: 'First Post body goes here', author: first_user) }
  let!(:second_post) { Post.create(title: 'Second Post', text: 'Second Post body goes here', author: first_user) }
  let!(:third_post) { Post.create(title: 'Third Post', text: 'Third Post body goes here', author: first_user) }
  let!(:fourth_post) { Post.create(title: 'Fourth Post', text: 'Fourth Post body goes here', author: first_user) }

  before do
    visit user_path(first_user)
  end

  describe 'content' do
    it "should display first_user's profile picture" do
      expect(page).to have_css("img[src='#{first_user.photo}']")
    end

    it "should display first_user's name" do
      expect(page).to have_content(first_user.name)
    end

    it 'should display number of posts' do
      expect(page).to have_content("Number of posts: #{first_user.posts_counter}")
    end

    it "should display first_user's bio" do
      expect(page).to have_content(first_user.bio)
    end

    it "should display first_user's recent 3 posts" do
      expect(page).to have_content(second_post.title)
      expect(page).to have_content(third_post.title)
      expect(page).to have_content(fourth_post.title)
    end

    it 'should display a button to view all posts' do
      expect(page).to have_link('See All Posts', href: user_posts_path(first_user))
    end
  end

  describe 'when clicking on a single post' do
    it 'should redirect to show page for correct post' do
      click_link third_post.title
      expect(current_path).to eq user_post_path(first_user, third_post)
    end
  end

  describe 'Clicking to see all posts' do
    it "should redirect to first_user's post's index page" do
      click_link 'See All Posts'
      expect(current_path).to eq user_posts_path(first_user)
    end
  end
end