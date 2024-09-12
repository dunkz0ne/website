require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    team = Team.create!(name: 'Atlanta Hawks', color: '#E03A3E', api: '1610612737')
    user = User.create!(name: 'Mario', email: 'mario@gmail.com', team_id: team.id, provider: 'facebook', password: 'password123', password_confirmation: 'password123')
    article = Article.create!(title: 'Test Title', content: 'Test content', user_id: user.id, team_id: user.team_id, draft: false)
    comment = Comment.new(content: 'Test content', user_id: user.id, article_id: article.id)
    expect(comment).to be_valid
  end

  it 'is not valid without a content' do
    comment = Comment.new(content: nil)
    expect(comment).to_not be_valid
  end
end
