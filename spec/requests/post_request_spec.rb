require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    describe "GET /posts/index" do
        it "returns a correct response status" do
            get "/users/1/posts"
            expect(response.status).to eq(200)
        end

        it "renderes correct template" do
            get "/users/1/posts"
            expect(response).to render_template(:index)
        end
        
        it "response body includes correct placeholder text" do
            get "/users/1/posts"
            expect(response.body).to include("<h1>HERE IS A LIST OF POSTS FOR A GIVEN USER</h1>")
        end
    end 

    describe "GET /posts/show" do
        it "returns a correct response status" do
            get "/users/1/posts/1"
            expect(response.status).to eq(200)
        end

        it "renderes correct template" do
            get "/users/1/posts/1"
            expect(response).to render_template(:show)
        end

        it "response body includes correct placeholder text" do 
            get "/users/1/posts/1"
            expect(response.body).to include("<h1>HERE IS A SINGLE POST BY A GIVEN USER</h1>")
        end
    end
end