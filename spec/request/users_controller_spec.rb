require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'assigns all users to @users and renders correct template with placeholder text' do
      user1 = User.create(name: 'John')
      user2 = User.create(name: 'Jane')

      get '/users'

      expect(assigns(:users)).to eq([user1, user2])
      expect(response).to have_http_status(200)            # Check response status
      expect(response).to render_template(:index)           # Check correct template rendering
      expect(response.body).to include('Welcome to user index page') # Check response body content
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user to @user and renders correct template with placeholder text' do
      user = User.create(name: 'John')

      get "/users/#{user.id}"

      expect(assigns(:user)).to eq(user)
      expect(response).to have_http_status(200)            # Check response status
      expect(response).to render_template(:show)           # Check correct template rendering
      expect(response.body).to include('Welcome to user show page') # Check response body content
    end
  end
end
