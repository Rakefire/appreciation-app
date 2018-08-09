module Users
  class UpdateForm < Rectify::Form
    include Concerns::EmailValidation

    mimic :user

    attribute :first_name,   String
    attribute :last_name,    String

    validates :first_name, :last_name, presence: true

    attr_reader :user
  end
end
