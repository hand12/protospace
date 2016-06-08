require 'rails_helper'
describe Product do
  describe 'associations' do
    context "with comments" do
      it "deletes the comments when product is deleted" do
        product = create(:product)
        before_delete_comment_num = Comment.count
        product.destroy
        after_delete_comment_num = Comment.count
        expect(after_delete_comment_num).to be < before_delete_comment_num
      end
    end
    context "with likes" do
      it "deletes the likes when product is deleted" do
        product = create(:product)
        product.likes << Like.create
        before_delete_like_num = Like.count
        product.destroy
        after_delete_like_num = Like.count
        expect(after_delete_like_num).to be < before_delete_like_num
      end
    end
  end
  describe 'validations' do
    context "with valid attributes" do
      it "has a valid factory" do
        product = build(:product)
        product.valid?
        expect(product).to be_valid
      end
    end
    context "without valid attributes" do
      it "is missing a title" do
        product = build(:product, title: "")
        product.valid?
        expect(product.errors[:title]).to include("can't be blank")
      end
      it "is missing a catchcopy" do
        product = build(:product, catchcopy: "")
        product.valid?
        expect(product.errors[:catchcopy]).to include("can't be blank")
      end
      it "is missing a concept" do
        product = build(:product, concept: "")
        product.valid?
        expect(product.errors[:concept]).to include("can't be blank")
      end
    end
  end
  describe '#posted_date' do
    it "returns dates in a specified format" do
      product = create(:product)
      day = Time.now.strftime("%b %d")
      posted_day = product.created_at.strftime("%b %d")
      expect(posted_day).to include(day)
    end
  end
  describe '#liked_by?(user)' do
    context "when liked by a user" do
      it "returns true" do
        product = create(:product)
        product.likes << Like.create
        expect(product.likes.present?).to be true
      end
    end
    context "when not liked by a user" do
      it "returns nil" do
        product = create(:product)
        expect(product.likes.present?).to be false
      end
    end
  end
end
