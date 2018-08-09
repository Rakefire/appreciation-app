require "rails_helper"

RSpec.describe Users::SignUp, type: :command do
  subject { described_class.new(form) }

  context "when the form is invalid" do
    let(:form) { double(:invalid? => true) }

    it "broadcasts :invalid" do
      expect { subject.call }.to broadcast(:invalid)
    end
  end

  context "when the form is valid" do
    let(:user) { User.order(:created_at => :desc).first }
    let(:form) do
      Rectify::StubForm.new(
        :valid?     => true,
        :email      => "me@here.com",
        :id         => 1,
      )
    end

    it "creates a new user" do
      expect { subject.call }.to change(User, :count).by(1)
    end

    it "adds the first adult to the user" do
      subject.call

      expect(user).to have_attributes(
        :email      => "me@here.com"
      )
    end

    it "send the user a verification email" do
      perform_enqueued_jobs do
        subject.call
      end

      verification_email = email_with_subject("Verifying Email Address")
      expect(verification_email).to be_present
    end

    it "broadcasts :ok" do
      expect { subject.call }.to broadcast(:ok)
    end

    context "when saving fails due to race condition of unique email" do
      it "broadcasts :race_non_unique_email" do
        create(:user, email: "me@here.com")

        expect { subject.call }.to broadcast(:race_non_unique_email)
      end
    end
  end
end
