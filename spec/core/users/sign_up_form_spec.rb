require "rails_helper"

RSpec.describe Users::SignUpForm do
  subject { described_class.from_params(params) }

  let(:params) do
    {
      "sign_up" => {
        "email" => "me@here.com"
      }
    }
  end

  describe "validation" do
    before { stub_query(Security::UserByEmail, :results => []) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "#email" do
      it "must be present" do
        subject.email = ""

        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end

      it "must be a valid email format" do
        subject.email = "this is present but not an email"

        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end

      it "must be unique within credentials" do
        stub_query(Security::UserByEmail, :results => User.new)

        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end
    end

  end
end
