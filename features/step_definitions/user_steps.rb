Given("I am on the home page") do
  visit root_path
  click_button('Join Us')
end

When('I click on Sign In with {string}') do |provider|
  click_button('Sign In with '+ provider)

end

When("I submit the registration form") do
  expect(page).to have_current_path(complete_registration_path)

  @team = Team.first

  find('#selectedTeamId', visible: false).set(@team.id)
  fill_in 'user_bio', with: 'I am a test'
  attach_file('user_photo', Rails.root.join('features', 'files', 'test_image.png'))

  expect(page).to have_button('Create User')
  click_button('Create User')
end

Then("I should be on the dashboard page") do
  expect(page).to have_current_path(user_dashboard_path)
end

Given('I am logged in with {string}') do |provider|
  # Set up OmniAuth mock
  OmniAuth.config.mock_auth[:provider] = OmniAuth::AuthHash.new({
    provider: 'facebook',
    uid: '123456',
    info: {
      email: 'test@example.com',
      name: 'Test User'
    }
  })

  # Visit the sign in path
  visit user_facebook_omniauth_callback_path

  find('#selectedTeamId', visible: false).set('1')
  click_button('Create User')

  visit user_dashboard_path

  # Ensure the user is redirected to the dashboard page
  expect(page).to have_current_path(user_dashboard_path)
end
