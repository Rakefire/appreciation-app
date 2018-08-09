require "rails_helper"

RSpec.describe "login", type: :system do
  context "when verified user" do
    let(:user) { create(:user) }

    it 'allows user to login' do
      visit root_path

      perform_enqueued_jobs do
        click_on "Sign In"
        fill_in "passwordless[email]", with: user.email
        click_on "Send magic link"

        mail = email_with_subject("Your magic link")
        expect(mail.to).to include(user.email)
      end
    end
  end

  context "when unverified user" do
    let(:user) { create(:user, :needing_verification) }

    it 'allows user to login' do
      visit root_path

      perform_enqueued_jobs do
        click_on "Sign In"
        fill_in "passwordless[email]", with: user.email
        click_on "Send magic link"

        mail = email_with_subject("Your magic link")
        expect(mail).to_not be_present
      end
    end
  end
end
