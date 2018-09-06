class User < ApplicationRecord
  validates :email, presence: true

  passwordless_with :email

  scope :verified, -> { where.not(verified_at: nil) }
  has_many :appreciations

  def verified?
    verified_at? && !verification_token.present?
  end
end
