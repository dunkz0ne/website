# config/initializers/canard.rb
Canard::Abilities.for(:journalist) do
  can :create, Article
  can [:update, :destroy], Article do |article, user|
    article.user_id == user.id
  end
end

Canard::Abilities.for(:user) do
  can :read, Article
end
