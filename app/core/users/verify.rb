module Users
  class Verify < Rectify::Command
    def initialize(params)
      token = params[:token]
      @user = User.find_by(verification_token: token)
    end

    def call
      return broadcast(:invalid) unless user.present? && !user.verified?

      Users::ForceVerify.new(user).call

      broadcast(:ok, user)
    end

    private

    attr_reader :user
  end
end
