require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders new users page" do
      get :new

      expect(:response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "With valid params" do
      it "logs the user in" do
        post :create, params: {user: {username: "Goose", password: "Maverick"}}
        user = User.find_by(username: "Goose")
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects to user show page" do
        post :create, params: {user: {username: "Goose", password: "Maverick"}}
        user = User.find_by(username: "Goose")
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "Without valid params" do
      it "renders errors on the new user page" do
        post :create, params: {user: {username: "Goose", password: "Mav"}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

    end
  end
end
