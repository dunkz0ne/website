Rails.application.config.session_store :redis_store, servers: "redis://localhost:3000/session"

Rails.application.config.session_store :active_record_store, :key => '_my_app_session'

