class SignUpsController < ApplicationController
  # GET /sign_up
  def new
    @form = Users::SignUpForm.new
  end

  # POST /sign_up
  # POST /sign_up
  def create
    @form = Users::SignUpForm.from_params(params)

    Users::SignUp.call(@form) do
      on(:ok) { redirect_to root_path }
      on(:invalid) { render :new}
      on(:race_non_unique_email) do
        flash.now[:alert] = t(:email_taken)
        render :new
      end
    end
  end

  # GET /sign_up/:token/verify
  def verify
    Users::Verify.call(params) do
      on(:ok) do
        flash[:alert] = t(:verified)
        redirect_to root_path
      end
      on(:invalid) do
        flash[:alert] = t(:already_verified)
        redirect_to root_path
      end
    end
  end
end
