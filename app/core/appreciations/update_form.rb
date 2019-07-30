module Appreciations
  class UpdateForm < Rectify::Form
    mimic :appreciation

    attribute :name, String
    attribute :quality, String
    attribute :note, String

    validates :name, presence: true
    validates :quality, presence: true
    validates :note, presence: true
  end
end
