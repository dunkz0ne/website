require 'omniauth'
require 'omniauth-facebook'

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: 'facebook',
  uid: '123456',
  info: {
    email: 'test@example.com',
    name: 'Test User'
  }
})
