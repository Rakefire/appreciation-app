module Appreciations
  class CreateForm < Rectify::Form
    mimic :appreciation

    attribute :name, String
    attribute :quality, String
    attribute :note, String
    # attribute :your_name, String

    validates :name, presence: true
    validates :quality, presence: true
    validates :note, presence: true
  end
end
