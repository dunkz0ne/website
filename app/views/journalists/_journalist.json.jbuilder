json.extract! journalist, :id, :name, :email, :team_id, :created_at, :updated_at
json.url user_url(journalist, format: :json)
