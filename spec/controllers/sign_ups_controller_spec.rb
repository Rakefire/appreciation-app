require 'rails_helper'

RSpec.describe SignUpsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to Sign Up, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { email: "test@here.com" }
  }

  let(:invalid_attributes) {
    { first_name: "Test", last_name: "User" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #new" do
    it "returns a new" do
      get :new, params: { }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {sign_up: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, params: {sign_up: valid_attributes}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {sign_up: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "GET #verify" do
    let(:user) { create(:user, :needing_verification) }

    context "when valid token" do
      it "returns a new" do
        get :verify, params: { token: user.verification_token }, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "when invalid token" do
      it "returns a new" do
        get :verify, params: { token: "RANDOM" }, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "when already used token" do
      let(:user) { create(:user, :needing_verification, verified_at: Time.now) }

      it "returns a new" do
        get :verify, params: { token: user.verification_token }, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
