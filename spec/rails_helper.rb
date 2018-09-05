# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
ENV['RACK_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require "wisper/rspec/matchers"
require "rectify/rspec"

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl
end

Rectify::RSpec::DatabaseReporter.enable

RSpec.configure do |config|
  config.include Features, type: :feature
  config.include Wisper::RSpec::BroadcastMatcher
  config.include EmailHelpers
  config.include Rectify::RSpec::Helpers
  config.include ActiveJob::TestHelper

  USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36.'

  Capybara.default_max_wait_time = 10

  config.before(:each, type: :system) do
    driven_by :rack_test
    page.driver.header('user-agent', USER_AGENT)
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless, options: { switches: %W[--user-agent=#{USER_AGENT}] }
    # driven_by :selenium_chrome, options: { switches: %W[--user-agent=#{USER_AGENT}] }
    Rails.application.routes.default_url_options[:host] = "localhost:#{Capybara.current_session.server.port}"
  end

  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
end
