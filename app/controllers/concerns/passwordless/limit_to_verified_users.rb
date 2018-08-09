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
        authenticatable_class.verified.where(
          "lower(#{email_field}) = ?", params[:passwordless][email_field].downcase
        ).first
      end
    end
  end
end
