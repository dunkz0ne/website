require 'omniauth'
require 'omniauth-facebook'

OmniAuth.config.test_mode = true

omniauth_hash = {
  'provider' => 'facebook',
  'uid' => '123456789',
  'info' => {
    'name' => 'Test User',
    'email' => 'test@example.com'
  },
  'credentials' => {
    'token' => 'mock_token',
    'refresh_token' => 'mock_refresh_token'
  }
}

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(omniauth_hash)

