require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_1) {create(:user)}
  it 'ensures default email matches' do
    expect(user_1.email).to eq('example@gmail.com')
  end

  it 'ensures default password matches' do
    expect(user_1.valid_password?('password')).to eq(true)
  end

  it 'ensures encrypted password' do
    expect(user_1.encrypted_password?).to eq(true)
  end
end
