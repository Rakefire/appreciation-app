require "rails_helper"

RSpec.describe "sign up ", type: :system do

  it 'allows user to sign up' do
    visit root_path

    perform_enqueued_jobs do
      click_on "Sign up"
      fill_in "Email", with: "ricky@rickychilcott.com"
      click_on "Create Sign up"

      mail = email_with_subject("Verifying Email Address")
      expect(mail.to).to include("ricky@rickychilcott.com")
    end
  end
end
