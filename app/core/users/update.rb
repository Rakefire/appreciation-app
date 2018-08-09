module Users
  class Update < Rectify::Command
    def initialize(form, user:)
      @form = form
      @user = user
    end

    def call
      return broadcast(:invalid) if form.invalid?

      transaction do
        update_user
      end

      broadcast(:ok)
    end

    private

    attr_reader :form, :user

    def update_user
      user.update_attributes(form.attributes.slice(:first_name, :last_name))
    end
  end
end
