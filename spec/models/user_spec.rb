require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build_stubbed(:user) }

  it 'requires email' do
    subject = build_stubbed(:user, email: nil)
    expect(subject).to be_invalid
  end

  context "needing verification" do
    subject { build_stubbed(:user, :needing_verification) }
    it '#verify?' do
      expect(subject).to_not be_verified
      expect(subject.verified_at).to be_nil
      expect(subject.verification_token).to_not be_nil
    end
  end

  context "already verified" do
    it '#verify?' do
      expect(subject).to be_verified
      expect(subject.verified_at).to_not be_nil
      expect(subject.verification_token).to be_nil
    end
  end

  context "with appreciations" do
    subject { create(:user) }

    before do
      create_list(:appreciation, 2, user: subject)
    end

    it 'has_many appreciations' do
      expect(subject.appreciations.count).to eq(2)
      expect(subject.appreciations.first).to be_a(Appreciation)
    end
  end
end
