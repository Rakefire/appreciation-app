require "rails_helper"

RSpec.describe Security::UserByEmail do
  let!(:me)    { create(:user, email: "me@here.com") }
  let!(:other) { create(:user, email: "other@here.com") }

  context "with case matching email" do
    it "returns credentials" do
      expect(described_class.new("me@here.com").first).to eq(me)
    end
  end

  context "with case mismatching email" do
    it "returns credentials" do
      expect(described_class.new("Me@hEre.Com").first).to eq(me)
    end
  end

  context "with mismatching email" do
    it "returns no matches" do
      expect(described_class.new("nope@here.com")).to be_none
    end
  end
end
