class Current < ActiveSupport::CurrentAttributes
  attribute :user

  def self.user?
    user.present?
  end
end
