class HomepageController < ApplicationController
  before_action do
    next unless Current.user?
    redirect_to(dashboard_index_path)
  end

  def index
  end
end
