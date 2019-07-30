class HomepageController < ApplicationController
  before_action do
    redirect_to(dashboard_index_path) if Current.user
  end

  def index
  end
end
