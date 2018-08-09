class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers
  before_action :set_current_user

  private

  def set_current_user
    Current.user = authenticate_by_cookie(User)
  end

  def require_user!
    return if Current.user
    save_passwordless_redirect_location!(User)
    redirect_to root_path, flash: { error: 'You are not worthy!' }
  end
end
