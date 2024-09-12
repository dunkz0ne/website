require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    team = Team.create!(name: 'Atlanta Hawks', color: '#E03A3E', api: '1610612737')
    user = User.create!(name: 'Mario', email: 'mario@gmail.com', team_id: team.id, provider: 'facebook', password: 'password123', password_confirmation: 'password123')
    article = Article.create!(title: 'Test Title', content: 'Test content', user_id: user.id, team_id: user.team_id, draft: false)
    comment = Comment.create!(content: 'Test content', user_id: user.id, article_id: article.id)
    like = Like.new(user_id: user.id, comment_id: comment.id)
    expect(like).to be_valid
  end
end
