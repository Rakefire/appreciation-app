class DashboardController < ApplicationController
  before_action :require_user!

  def index
    appreciations = Current.user.appreciations

    @appreciations_count = appreciations.count
    @appreciations = appreciations
  end
end
