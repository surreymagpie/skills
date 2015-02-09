require 'rails_helper'

RSpec.describe Skill, type: :model do
  it { should respond_to :description }
  it { should respond_to :user }

  describe "validation" do
    it "requires a description" do
      skill = Skill.create()
      expect(skill).to_not be_valid
    end
  end
end
