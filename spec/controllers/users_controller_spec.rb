require 'rails_helper'
describe UsersController do

  context "with user login" do
    let!(:user) {create(:user)}
    let(:params) {{
      id: user,
      user: attributes_for(:user, name: 'mage')
    }}
    before {
      login_user
    }

    describe 'GET #show' do
      before :each do
        get :show,
        params
      end
      it "assignd the requested to user" do
        expect(assigns(:user)).to eq user
      end
      it "renders the :show templates" do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before :each do
        get :edit,
        params
      end
      it "assignd the requested to user" do
        expect(assigns(:user)).to eq user
      end
      it "renders the :edit templates" do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before :each do
        patch :update,
        params
      end
      it "assignd the requested to user" do
        expect(assigns(:user)).to eq user
      end
      it "changes user's attributes" do
        user.reload
        expect(user.name).to eq("mage")
      end
      it "redirects root path" do
        expect(response).to redirect_to root_path
      end
      it "sends flash messages" do
        expect(flash[:notice]).to eq 'Your user infomation was successfully updated'
      end
    end
  end

  context "without user login" do
    let!(:user) {create(:user)}
    let!(:params) {{id: user}}

    describe 'GET #edit' do
      it "redirects sign_in page" do
        get :edit, params
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it "redirects sign_in page" do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
