require "rails_helper"

RSpec.describe SignUpsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/sign_ups/new").to route_to("sign_ups#new")
    end

    it "routes to #create via POST" do
      expect(:post => "/sign_ups").to route_to("sign_ups#create")
    end

  end
end
