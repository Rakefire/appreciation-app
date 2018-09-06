module Users
  class SendWelcomeEmail < Rectify::Command
    def initialize(user)
      @user = user
    end

    def call
      return broadcast(:invalid) unless user.present? && user.verified?

      UserMailer.welcome(user).deliver_later

      broadcast(:ok)
    end

    private

    attr_reader :user
  end
end
