require "rails_helper"

RSpec.describe Users::Update, type: :command do
  let(:user) { create(:user) }
  subject { described_class.new(form, user: user) }

  context "when the form is invalid" do
    let(:form) { double(:invalid? => true) }

    it "broadcasts :invalid" do
      expect { subject.call }.to broadcast(:invalid)
    end
  end

  context "when the form is valid" do
    let(:user) { create(:user) }
    let(:form) do
      Rectify::StubForm.new(
        :valid?     => true,
        :first_name => "Ricky",
        :last_name  => "Chilcott"
      )
    end

    it "creates a new user" do
      expect { subject.call }.to change(User, :count).by(1)
    end

    it "adds the first adult to the user" do
      subject.call

      expect(user).to have_attributes(
        :first_name => "Ricky",
        :last_name  => "Chilcott"
      )
    end

    it "broadcasts :ok" do
      expect { subject.call }.to broadcast(:ok)
    end
  end
end
