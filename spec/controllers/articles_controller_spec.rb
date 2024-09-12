# spec/controllers/articles_controller_spec.rb
require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:team) { Team.create(name: 'Atlanta Hawks', color: '#E03A3E', api: '1610612737') }
  let(:user) {  User.create(name: 'Mario', email: 'mario@gmail.com', team_id: team.id, provider: 'facebook', password: 'password123', password_confirmation: 'password123') }
  let(:article) { Article.create(title: 'Test Title', content: 'Test content', user_id: user.id, team_id: user.team_id, draft: false) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "assigns @articles and renders the index template" do
      get :index
      expect(assigns(:articles)).not_to be_nil
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested article and renders the show template" do
      get :show, params: { id: article.id }
      expect(assigns(:article)).to eq(article)
      expect(response).to render_template(:show)
    end
  end




  describe "PATCH/PUT #update" do
    it "updates the article and redirects to the show page" do
      patch :update, params: { id: article.id, article: { title: "New Title" } }
      article.reload
      expect(article.title).to eq("New Title")
      expect(response).to redirect_to(article_path(article))
    end
  end


end
