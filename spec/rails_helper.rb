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

  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
end
