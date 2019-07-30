module Passwordless
  module SignInHelper
    def sign_in_as(authenticatable)
      session = Passwordless::Session.create! authenticatable_type: authenticatable.class,
                                              authenticatable_id: authenticatable.id,
                                              timeout_at: 1.day.from_now,
                                              expires_at: 1.day.from_now,
                                              user_agent: 'fake-user-agent',
                                              remote_addr: '127.0.0.1'

      visit Passwordless::Engine.routes.
                                 url_helpers.
                                 token_sign_in_path(session.token)
    end
  end
end
