require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
    let!(:first_user) { User.create(name: 'Yeti', bio: 'Full-stack', photo: 'user1.jpg', posts_counter: 1) }


  before do
    visit users_path
  end

  describe 'Page content' do
    
  end
end