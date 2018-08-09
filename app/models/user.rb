class User < ApplicationRecord
  validates :email, presence: true

  passwordless_with :email

  scope :verified, -> { where.not(verified_at: nil) }

  def verified?
    verified_at?
  end
end
