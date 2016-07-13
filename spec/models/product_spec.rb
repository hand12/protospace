require 'rails_helper'
describe Product do
  describe 'associations' do
    context "with comments" do
      let(:comments_count) {5}
      let!(:product) {create(:product, :with_comments)}
      it "deletes the comments when product is deleted" do
        expect{product.destroy}.to change(Comment, :count).by(-1*comments_count)
      end
    end
    context "with likes" do
      let(:likes_count) {5}
      let!(:product) {create(:product, :with_likes)}
      it "deletes the likes when product is deleted" do
        expect{product.destroy}.to change(Like, :count).by(-1*likes_count)
      end
    end
    context "with images" do
      let(:images_count) {5}
      let!(:product) {create(:product, :with_images)}
      it "deletes the images when product is deleted" do
        expect{product.destroy}.to change(ProductImage, :count).by(-1*images_count)
      end
    end
  end
  describe 'validations' do
    context "with valid attributes" do
      let(:product) {create(:product)}
      it "has a valid factory" do
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
  describe "#strftime" do
    it "returns dates in a specified format" do
      product = build(:product, created_at: "2016-05-07")
      expect(product.created_at.strftime("%b %d %a")).to eq "May 07 Sat"
    end
  end
end
