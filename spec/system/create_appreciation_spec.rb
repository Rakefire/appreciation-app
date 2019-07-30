require "rails_helper"

RSpec.describe "create appreciation", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in_as(user)
  end

  it "allows creation" do
    visit dashboard_index_path
    click_link "+"

    expect(page).to have_content("Who is someone you care about that deserves to be recognized?")
    fill_name "Jenny"
    select_quality "loving"
    fill_note "Always thinking about me."
    click_button "Send Appreciation"
  end

  private

  def fill_name(name)
    fill_in "name", with: name
  end

  def fill_note(text)
    # fill_in "note", with: text
  end

  def select_quality(quality)
    # select quality, from: "quality"
  end
end
