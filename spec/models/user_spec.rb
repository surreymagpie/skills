require "rails_helper"

RSpec.describe User, type: :model do

  describe "class" do
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :full_name }
    it { should respond_to :email }
    it { should respond_to :dept }
    it { should respond_to :extn }
    it { should respond_to :admin }
    it { should respond_to :password }
    it { should respond_to :password_digest }
    it { should respond_to :password_confirmation }
    it { should respond_to :skills }
  end

  describe "validation" do
    let(:user) { create(:user) }

    it "requires a first_name" do
      user.first_name = ""
      expect(user).to be_invalid
    end

    it "requires a last_name" do
      user.last_name = ""
      expect(user).to be_invalid
    end

    it "requires a unique email" do
      expect(user).to be_valid
      user.email = ""
      expect(user).to be_invalid
      user2 = build(:user,
        first_name: "Rob", last_name: "Curtis", email: "john.smith@example.com",
        password: "password", password_confirmation: "password")
      expect(user2).to be_invalid
    end

    it "requires a password" do
      user.password = ""
      user.password_confirmation = ""
      expect(user).to be_invalid
    end

    it "requires matching passwords" do
      user.password_confirmation = "wrong"
      expect(user).to be_invalid
    end
  end

  describe "admin" do
    let(:admin_user) { create(:admin, email: "admin@example.com") }

    it "has admin set to true" do
      expect(admin_user.admin).to be true
    end
  end

end
