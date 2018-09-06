# frozen_string_literal: true

module Passwordless
  module SignInHelpers
    extend ActiveSupport::Concern

    included do
      alias_method :sign_in_orig, :sign_in

      def sign_in(authenticatable)
        force_verify(authenticatable)
        log_login(authenticatable)

        sign_in_orig(authenticatable)
      end

      def force_verify(authenticatable)
        return if authenticatable.verified?

        Users::ForceVerify.new(authenticatable).call
      end

      def log_login(authenticatable)
        return
        # TODO: Log login somewhere
      end
    end
  end
end
