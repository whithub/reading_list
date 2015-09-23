require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    context "on a new user" do
      it "should not be valid without a password" do
        user = User.new password: nil, password_confirmation: nil
        user.should_not be_valid
      end
    end

    context "on an existing user" do
      let(:user) do
        user = User.create(name: "Whitney",
                           email: 'whit@example.com',
                           password: 'password',
                           password_confirmation: 'password')
      end

      it { is_expected.to validate_presence_of(:name) }

      it 'requires an email that is also unique' do
        is_expected.to validate_presence_of(:email)
        is_expected.to validate_uniqueness_of(:email)
      end

      it "should not be valid with an empty password" do
        user.password = user.password_confirmation = ""
        user.should_not be_valid
      end

      it "should be valid with a new (valid) password" do
        user.password = user.password_confirmation = "new password"
        user.should be_valid
      end
    end
  end
end
