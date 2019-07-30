class AppreciationsController < ApplicationController
  before_action :require_user!

  def new
    @appreciation = Appreciations::CreateForm.new
  end

  def edit
    appreciation = Current.user.appreciations.find(params[:id])
    @appreciation = Appreciations::UpdateForm.from_model(appreciation)
  end

  def create
    form = Appreciations::CreateForm.
      from_params(params).
      with_context(user_id: Current.user.id)
    @appreciation = form

    Appreciations::Create.call(form) do
      on(:ok) { |appreciation| redirect_to appreciation_path(appreciation) }
      on(:invalid) { render :new }
    end
  end

  def update
    form = Appreciations::UpdateForm.
      from_params(params).
      with_context(user_id: Current.user.id)

    @appreciation = form
    Appreciations::Update.call(form) do
      on(:ok) { |appreciation| redirect_to apprecitation }
      on(:invalid) { render :edit }
    end
  end

  def destroy
    appreciation = Current.user.appreciations.find(params[:id])
    appreciation.destroy
    redirect_to dashboard_index_path, notice: "Appreciation has been removed"
  end
end
