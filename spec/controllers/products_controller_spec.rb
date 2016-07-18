require 'rails_helper'
describe ProductsController do
  let!(:user) {create(:user)}
  let!(:product) {create(:product, :with_images)}
  let(:params) {{
    id: product.id,
    product: attributes_for(:product,
    title: 'mage')
  }}

  context "with user login" do
    before {login_user}
    describe 'GET #index' do
      before do
        get :index
      end

      it "assignd the requested to products" do
        binding.pry
        expect(assigns(:products)).to include product
      end

      it "renders the :show templates" do
        expect(response).to render_template :index
      end
    end

    describe 'GET #edit' do
      before :each do
        login_user
      end
      it "assignd the requested to user" do
        get :edit, id: user
        expect(assigns(:user)).to eq user
      end
      it "renders the :edit templates" do
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end
    describe 'PATCH #update' do
      before :each do
        login_user
      end
      it "assignd the requested to user" do
        patch :update, id: user, user: attributes_for(:user)
        expect(assigns(:user)).to eq user
      end
      it "changes user's attributes" do
        patch :update, id: user, user: attributes_for(:user, name: 'mage')
        user.reload
        expect(user.name).to eq("mage")
      end
      it "redirects root path" do
        patch :update, id: user, user: attributes_for(:user)
        expect(response).to redirect_to root_path
      end
      it "sends flash messages" do
        patch :update, id: user, user: attributes_for(:user)
        expect(flash[:notice]).to eq 'Your user infomation was successfully updated'
      end
    end
  end
  context "without user login" do
    let!(:user) {create(:user)}
    describe 'GET #edit' do
      it "redirects sign_in page" do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'PATCH #update' do
      it "redirects sign_in page" do
        patch :update, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
