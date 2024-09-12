require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    team = Team.create!(name: 'Atlanta Hawks', color: '#E03A3E', api: '1610612737')
    user = User.new(name: 'Mario', email: 'mario@gmail.com', team_id: team.id, provider: 'facebook', password_digest: SecureRandom.hex)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
end
