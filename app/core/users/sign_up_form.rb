module Users
  class SignUpForm < Rectify::Form
    include Concerns::EmailValidation

    mimic :sign_up
    attribute :email, String

    validates :email, presence: true, email: true
    validate :validate_email_uniqueness
  end
end
