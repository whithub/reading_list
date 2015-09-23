require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) do
    user = User.create(uid: 1,
                       name: "Whitney",
                       email: 'whit@example.com',
                       password: 'password',
                       password_confirmation: 'password')
  end

  it { is_expected.to validate_presence_of(:name) }

  it 'requires an email that is also unique' do
    is_expected.to validate_presence_of(:email)
    is_expected.to validate_uniqueness_of(:email)
  end

  xit 'requires a password' do
    is_expected.to validate_presence_of(:email)
    is_expected.to validate_uniqueness_of(:email)
  end

end
