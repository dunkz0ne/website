require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
    team = Team.create!(name: 'Atlanta Hawks', color: '#E03A3E', api: '1610612737')
    user = User.create!(name: 'Mario', email: 'mario@gmail.com', team_id: team.id, provider: 'facebook', password: 'password123', password_confirmation: 'password123')
    article = Article.new(title: 'Test Title', content: 'Test content', user_id: user.id, team_id: user.team_id, draft: false)
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    article = Article.new(title: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without content' do
    article = Article.new(content: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a user_id' do
    article = Article.new(user_id: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a team_id' do
    article = Article.new(team_id: nil)
    expect(article).to_not be_valid
  end

  it 'is valid when draft is true or false' do
    team = Team.create!(name: 'Atlanta Hawks', color: '#E03A3E', api: '1610612737')
    user = User.create!(name: 'Mario', email: 'mario@gmail.com', team_id: team.id, provider: 'facebook', password: 'password123', password_confirmation: 'password123') 
    article = Article.new(title: 'Test Title', content: 'Test content', user_id: user.id, team_id: team.id, draft: true)
    expect(article).to be_valid
    article.draft = false
    expect(article).to be_valid
  end
end
