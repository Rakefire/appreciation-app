require "rails_helper"

RSpec.describe Appreciation, type: :model do
  subject { build_stubbed :appreciation }

  it "has valid factory" do
    expect(subject).to be_valid
  end

  context "when created" do
    subject { create :appreciation }

    it "has user" do
      expect(subject.user).to be_a(User)
    end

    it "doesn't have an access_code" do
      expect(subject.access_code).to be_nil
    end
  end

  context "when finalized" do
    subject { create :appreciation }

    before do
      Appreciations::Finalize.new(subject).call
    end

    it "#finalized?" do
      expect(subject.finalized?).to eq(true)
    end

    it "#read?" do
      expect(subject.read?).to eq(false)
    end

    it "has an access_code" do
      expect(subject.access_code).to_not be_nil
    end
  end

  context "when read" do
    subject { create :appreciation }

    before do
      Appreciations::Finalize.new(subject).call
      Appreciations::MarkAsRead.new(subject).call
    end

    it "#finalized?" do
      expect(subject.finalized?).to eq(true)
    end

    it "#read?" do
      expect(subject.read?).to eq(true)
    end

    it "doesn't have an access_code" do
      expect(subject.access_code).to be_nil
    end
  end
end
