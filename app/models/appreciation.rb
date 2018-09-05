class Appreciation < ApplicationRecord
  belongs_to :user

  def read?
    !!read_at
  end

  def finalized?
    !!finalized_at
  end
end
