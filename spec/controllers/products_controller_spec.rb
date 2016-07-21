require 'rails_helper'
describe ProductsController do
  let!(:user) {create(:user)}
  let!(:product) {create(:product, :with_images)}
  let(:params) {{
    id: product,
    product: attributes_for(:product,
    title: 'mage')
  }}
  let(:unvalid_params) {{
    id: product,
    product: attributes_for(:product,
    title: nil)
  }}

  context "with user login" do
    before {login_user}
    describe 'GET #index' do
      before do
        get :index
      end

      it "assignd the requested to products" do
        expect(assigns(:products)).to include product
      end

      it "renders the :show templates" do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it "assignd the requested to product" do
        expect(assigns(:product)).to be_a_new Product
      end
      it "renders the :new templates" do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      before do
        post :create, params
      end
      context 'with valid attributes' do
        it "save the new product in the database" do
          expect{
            post :create,
            params
            }.to change{Product.count}.by(+1)
        end
        it "redirects to root_path" do
          expect(response).to redirect_to root_path
        end
        it "show flash messages to show save the product successfully" do
          expect(flash[:notice]).to eq 'create a product!'
        end
      end
      context 'with unvalid attributes' do
        it "couldn't save the new product" do
          expect{
            post :create,
            unvalid_params
            }.to change{Product.count}.by(0)
        end
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: product
      end
      it "assigns the requested product to @product" do
        expect(assigns(:product)).to eq product
      end
      it "assigns the requested comment to @comment" do
        expect(assigns(:comment)).to be_a_new Comment
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, id: product
      end
      it "assigns the requested product to @product" do
        expect(assigns(:product)).to eq product
      end
      let!(:product_image){build:product_image}
      it "assigns the main_image to @product_image" do
        expect(assigns(:product_image)).to be_a_new ProductImage
      end
      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        before  do
          patch :update, params
        end
        it "assignd the requested product to @product" do
          expect(assigns(:product)).to eq product
        end
        it "upgrades attributes of product" do
          product.reload
          expect(product.title).to eq("mage")
        end
        it "redirects to root_path" do
          expect(response).to redirect_to root_path
        end
        it "show flash messages to show update product successfuly" do
          expect(flash[:notice]).to eq 'update a product!'
        end
      end
      context 'with unvalid attributes' do
        before  do
          patch :update, params
        end
        it "couldn't update the product" do
          expect{
            patch :update,
            unvalid_params
            }.to change{Product.count}.by(0)
        end
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
    describe 'GET #new' do
      it "redirects sign_in page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'POST #create' do
      it "redirects sign_in page" do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'GET #edit' do
      it "redirects sign_in page" do
        get :edit, id: product
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'PATCH #update' do
      it "redirects sign_in page" do
        patch :update, id: product
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'DELETE #destroy' do
      it "redirects sign_in page" do
        delete :destroy, id: product
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
