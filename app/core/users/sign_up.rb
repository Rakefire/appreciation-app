module Users
  class SignUp < Rectify::Command
    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid) if form.invalid?

      transaction do
        create_user
      end

      send_verification_email

      broadcast(:ok)

    rescue ActiveRecord::RecordNotUnique
      broadcast(:race_non_unique_email)
    end

    private

    attr_reader :form, :user

    def create_user
      attrs = form.
                attributes.
                slice(:email).
                merge(verification_token: generate_verification_token)
      @user ||= User.create(attrs)
    end

    def send_verification_email
      UserMailer.verification(user).deliver_later
    end

    def generate_verification_token
      SecureRandom.uuid
    end
  end
end
