require 'rails_helper'
describe User do
  describe '#create' do
    describe "with valid attributes" do

      it "it is valid with all attributes" do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
      end

    end

    describe "without valid attributes" do

      it "it is invalid without a name" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "it is invalid without an email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "it is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "it is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end


      it "it is invalid with a duplicate email address" do
        user_a = build(:user, email: "sample@gmail.com")
        user_b = build(:user, email: "sample@gmail.com")
        user_a.save
        user_b.valid?
        expect(user_b.errors[:email]).to include("has already been taken")
      end

      it "it is invalid with a password that has less than 7 characters" do
        user = build(:user, password: "aaa")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end

    end

  end
end
