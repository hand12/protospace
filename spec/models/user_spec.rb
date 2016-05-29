require 'rails_helper'
describe User do
  describe '#create' do
    it "it is valid with all attributes" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "it is not valid without email attributes" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "it is not valid without name attributes" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

  end
end