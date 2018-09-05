module Appreciations
  class Finalize < Rectify::Command
    def initialize(appreciation)
      @appreciation = appreciation
    end

    def call
      return broadcast(:invalid) if appreciation.finalized?

      appreciation.update_attributes finalized_at: Time.now,
                                     access_code: SecureRandom.alphanumeric

      broadcast(:ok)
    end

    private

    attr_reader :appreciation
  end
end
