require "rails_helper"

RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { first_name: "Test", last_name: "User" }
  }

  let(:invalid_attributes) {
    { email: "another@email.com", verification: true }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user) { create(:user) }
  before { Current.user = user }

  describe "GET #show" do
    it "returns a success response" do
      user = create :user, valid_attributes
      get :show, params: { id: user.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      user = create :user, valid_attributes
      get :edit, params: { id: user.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { first_name: "Test", last_name: "User" }
      }

      it "updates the requested user" do
        user = create :user, valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        user.reload

        expect(user.first_name).to eq("Test")
        expect(user.last_name).to eq("User")
      end

      it "redirects to the user" do
        user = create :user, valid_attributes
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        user = create :user, valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
