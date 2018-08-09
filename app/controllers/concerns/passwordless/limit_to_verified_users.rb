# frozen_string_literal: true

require 'bcrypt'

module Passwordless
  module LimitToVerifiedUsers
    extend ActiveSupport::Concern

    included do
      # Instead of just overwriting, we're aliasing the method so that future upgrades
      # to Passwordless may raise an error if the private method implementation has
      # changed
      alias_method :find_authenticatable_orig, :find_authenticatable

      def find_authenticatable
        email = (params.dig(:passwordless, :email) || "").downcase
        email.presence &&
          authenticatable_class.verified.find_by("lower(#{email_field}) = ?", email)
      end
    end
  end
end
