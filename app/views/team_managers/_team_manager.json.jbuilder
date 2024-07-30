json.extract! team_manager, :id, :name, :email, :team_id, :created_at, :updated_at
json.url user_url(team_manager, format: :json)
