require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a correct response status' do
      get '/users/index'
      expect(response.status).to eq(200)
    end

    it 'renderes correct template' do
      get '/users/'
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get '/users/'
      expect(response.body).to include('<h1>HERE IS A LIST OF ALL USERS</h1>')
    end
  end

  describe 'GET /show' do
    it 'returns a correct response status' do
      get '/users/show'
      expect(response.status).to eq(200)
    end

    it 'renderes correct template' do
      get '/users/show'
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      get '/users/show'
      expect(response.body).to include('<h1>SHOWS A SINGLE USER</h1>')
    end
  end
end
