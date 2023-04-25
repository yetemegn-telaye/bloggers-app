require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:first_user) { User.create(name: 'Yeti', bio: 'Full-stack', photo: 'user1.jpg', posts_counter: 1) }
  let!(:second_user) { User.create(name: 'Aman', bio: 'Developer', photo: 'user2.jpg', posts_counter: 2) }
  let!(:third_user) { User.create(name: 'Abebe', bio: 'Developer', photo: 'user3.jpg', posts_counter: 3) }

  before do
    visit users_path
  end

  describe 'Page content' do
    it 'should display all usernames' do
      expect(page).to have_content(first_user.name)
      expect(page).to have_content(second_user.name)
      expect(page).to have_content(third_user.name)
    end

    it 'should display all profile pictures' do
      expect(page).to have_css("img[src='#{first_user.photo}']")
      expect(page).to have_css("img[src='#{second_user.photo}']")
      expect(page).to have_css("img[src='#{third_user.photo}']")
    end

    it 'should display number of posts for each user' do
      expect(page).to have_content("Number of posts: #{first_user.posts_counter}")
      expect(page).to have_content("Number of posts: #{second_user.posts_counter}")
      expect(page).to have_content("Number of posts: #{third_user.posts_counter}")
    end
  end

  describe 'Clicking on each user' do
    it "should redirect to first users's show page" do
      click_link first_user.name
      expect(current_path).to eq user_path(first_user)
    end

    it "should redirect to second users's show page" do
      click_link second_user.name
      expect(current_path).to eq user_path(second_user)
    end

    it "should redirect to third users's show page" do
      click_link third_user.name
      expect(current_path).to eq user_path(third_user)
    end
  end
end