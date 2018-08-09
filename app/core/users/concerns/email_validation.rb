module Users
  module Concerns
    module EmailValidation
      include ActiveSupport::Concern

      private

      def validate_email_uniqueness
        return if Security::UserByEmail.new(email).none?

        errors.add(:email, I18n.t("email_already_in_use"))
      end
    end
  end
end
