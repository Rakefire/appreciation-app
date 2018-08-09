require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome(user) }

    it "renders the headers" do
      expect(mail.subject).to include("Welcome!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["youre-awesome@appreciation.app"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "verification" do
    let(:user) { create(:user, :needing_verification) }
    let(:mail) { UserMailer.verification(user) }

    it "renders the headers" do
      expect(mail.subject).to include("Verifying Email Address")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["youre-awesome@appreciation.app"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
