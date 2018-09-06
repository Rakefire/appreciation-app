module Users
  class ForceVerify < Rectify::Command
    def initialize(user)
      @user = user
    end

    def call
      return broadcast(:invalid) unless user.present? && !user.verified?

      if verify_user
        Users::SendWelcomeEmail.new(user).call
        broadcast(:ok)
      else
        broadcast(:invalid)
      end
    end

    private

    attr_reader :user

    def verify_user
      user.update_attributes verified_at: Time.now,
                             verification_token: nil
    end
  end
end
