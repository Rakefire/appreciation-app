module Appreciations
  class MarkAsRead < Rectify::Command
    def initialize(appreciation)
      @appreciation = appreciation
    end

    def call
      return broadcast(:invalid) if !appreciation.finalized?

      appreciation.update_attributes read_at: Time.now,
                                     access_code: nil

      broadcast(:ok)
    end

    private

    attr_reader :appreciation
  end
end
