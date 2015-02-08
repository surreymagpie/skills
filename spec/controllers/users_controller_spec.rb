require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "Where a user exists" do

    let(:user) { create(:user) }

    describe "GET #show" do
      it "returns http success" do
        get :show, id: user
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, id: user
        expect(response).to have_http_status(:success)
      end
    end
  end
end
