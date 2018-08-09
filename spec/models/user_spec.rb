require 'rails_helper'

RSpec.describe User, type: :model do

  it 'requires email' do
    user = build_stubbed(:user, email: nil)
    expect(user).to be_invalid
  end

  context "needing verification" do
    it '#verify?' do
      user = build_stubbed(:user, :needing_verification)

      expect(user).to_not be_verified
      expect(user.verified_at).to be_nil
      expect(user.verification_token).to_not be_nil
    end
  end

  context "already verified" do
    it '#verify?' do
      user = build_stubbed(:user)

      expect(user).to be_verified
      expect(user.verified_at).to_not be_nil
      expect(user.verification_token).to be_nil
    end
  end
end
