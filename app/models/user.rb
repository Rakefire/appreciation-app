class User < ApplicationRecord
  validates :email, presence: true

  passwordless_with :email

  def verified?
    verified_at?
  end
end
