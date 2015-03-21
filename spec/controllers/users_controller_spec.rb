require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context "When logged out" do
    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #index" do
      it "redirects to login url" do
        get :index
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to login_url
      end
    end
  end

  context "When logged in as a normal user" do

    let(:user) { create(:user) }

    describe "GET #index" do
      it "redirects to users show page" do
        get :index, nil, {user_id: user.id}
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to user_path(user)
      end
    end
  end

  context "When logged in as admin" do

    let(:user) { create(:user, admin: true) }

    describe "GET #index" do
      it "succeeds" do
        get :index, nil, { user_id: user.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, { id: user }, { user_id: user.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, { id: user }, { user_id: user.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
