require 'rails_helper'

feature 'Sign in' do
  given!(:user) {build(:user)}
  scenario 'Sign up' do
    visit root_path
    click_on 'Get Started'
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    fill_in 'user_member', with: user.member
    fill_in 'user_profile', with: user.profile
    fill_in 'user_work', with: user.work
    click_on 'Save'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  given(:login_user) { create(:user) }
  given(:product) { build(:product, :with_images_build) }
  scenario 'Sign in & post product' do
    visit root_path
    click_on 'Sign In'
    fill_in 'user_email', with: login_user.email
    fill_in 'user_password', with: login_user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'

    click_on 'New Proto'
    fill_in 'product_title', with: product.title
    fill_in 'product_catchcopy', with: product.catchcopy
    fill_in 'product_concept', with: product.concept

    3.times do |i|
      attach_file "product[product_images_attributes][#{i}][image]", "spec/fixtures/img/sample.jpg"
    end
    click_on 'Publish'
    expect(page).to have_selector '.notice', text: 'create a product!'
  end

end

