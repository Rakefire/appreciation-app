module Security
  class UserByEmail < Rectify::Query
    def initialize(email)
      @email = email
    end

    def query
      User.where(
        "lower(email) = lower(:email)", email: email
      )
    end

    private

    attr_reader :email
  end
end
