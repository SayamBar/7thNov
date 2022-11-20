require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET registrations/new" do
    it "renders the sign up page" do
      get new_user_registration_path 
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET sessions/new" do
    it "renders the sign in page" do
      get new_user_session_path 
      expect(response).to have_http_status(200)
    end
  end

  # describe "DELETE sessions/destroy" do
  #   user = User.create(email:"ajhfbah@gmail.com",password:"9073065098")
  #   it "sign out" do
  #     post user_session_path(user)
  #     delete destroy_user_session_path(user) 
  #     expect(response).to be_successful
  #   end
  # end

  describe "POST sessions/create" do
    user = User.create(email:"ajhfbah@gmail.com",password:"9073065098")
    it "sign in" do
      post user_session_path(user)
      expect(response).to be_successful
    end
  end

  # describe "GET registrations/edit" do
  #   user = User.create(email:"ajhfbah@gmail.com",password:"9073065098")
  #   it "renders the edit page" do
  #     get edit_user_registration_path(user)
  #     expect(response).to be_successful
  #   end
  # end
end
