module Users
  class Verify < Rectify::Command
    def initialize(params)
      token = params[:token]
      @user = User.find_by(verification_token: token)
    end

    def call
      return broadcast(:invalid) if !user.present?
      return broadcast(:invalid) if user.verified?

      transaction do
        verify_user
      end

      send_welcome_email

      broadcast(:ok)
    end

    private

    attr_reader :user

    def verify_user
      user.update_attributes verified_at: Time.now,
                             verification_token: nil
    end

    def send_welcome_email
      UserMailer.welcome(user).deliver_later
    end
  end
end
