require 'rails_helper'
describe ProductImage do
  describe '#create' do
    let!(:image) {build(:product_image, :set_status_main, image:"sample.hoge")}
    it "has the wrong content format" do
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end
    context "with valid attributes" do
      let!(:image) {build(:product_image, :set_status_main)}
      it "has a valid factory" do
        image.valid?
        expect(image).to be_valid
      end
    end
    context "without content attribute" do
      let!(:image) {build(:product_image, :set_status_main, image: "")}
      it "returns error" do
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end
    end
    context "with status attribute" do
      let!(:image) {build(:product_image, :set_status_main)}
      it "returns error" do
        expect(image).to be_valid
      end
    end
  end
end
