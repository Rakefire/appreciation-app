class UsersController < ApplicationController
  before_action :require_user!
  before_action :set_user

  # GET /users/:id
  def show
  end

  # GET /users/:id/edit
  def edit
    @form = Users::UpdateForm.from_model(@user)
  end

  # PUT /users/:id
  def update
    @form = Users::UpdateForm.from_params(params, user: @user)

    Users::Update.call(@form, user: @user) do
      on(:ok) { redirect_to root_path }
      on(:invalid) { render :edit }
    end
  end

  private

  def set_user
    @user = Current.user
  end
end
