require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'support/controller_macros'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerMacros, :type => :controller
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  #処理が行われたら、ダミーデータを作成し、処理が終わるとそのデータを削除するが、その削除の処理をdatabase_clearnerで行うため、ここではfalseにしておく。
  config.include FactoryGirl::Syntax::Methods
  config.infer_spec_type_from_file_location!

end
