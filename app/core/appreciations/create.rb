module Appreciations
  class Create < Rectify::Command
    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid) unless form.valid?

      attrs = form.
                attributes.
                merge({ user_id: form.context.user_id })

      appreciation = Appreciation.create(attrs)
      broadcast(:ok, appreciation)
    end

    private

    attr_reader :form
  end
end
