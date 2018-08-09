require "rails_helper"

RSpec.describe Users::UpdateForm do
  subject { described_class.from_params(params) }

  let(:params) do
    {
      "user" => {
        "first_name" => "Andy",
        "last_name" => "Pike",
      }
    }
  end

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "#first_name" do
      it "must be present" do
        subject.first_name = ""

        expect(subject).to be_invalid
        expect(subject.errors[:first_name]).to be_present
      end
    end

    describe "#last_name" do
      it "must be present" do
        subject.last_name = ""

        expect(subject).to be_invalid
        expect(subject.errors[:last_name]).to be_present
      end
    end

  end
end
