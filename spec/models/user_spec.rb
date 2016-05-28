require 'rails_helper'
describe User do
  describe '#create' do
    it "with valid attributes" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "without email attributes" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "without password attributes" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "without password_confirmation attributes" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "without avatar attributes" do
      user = build(:user, avatar: "")
      user.valid?
      expect(user).to be_valid
    end

    it "without member attributes" do
      user = build(:user, member: "")
      user.valid?
      expect(user).to be_valid
    end


    it "without profile attributes" do
      user = build(:user, profile: "")
      user.valid?
      expect(user).to be_valid
    end

    it "without name attributes" do
      user = build(:user, name: "")
      user.valid?
      expect(user).to be_valid
    end

    it "without work attributes" do
      user = build(:user, work: "")
      user.valid?
      expect(user).to be_valid
    end
  end
end