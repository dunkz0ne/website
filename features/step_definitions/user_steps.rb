Given("I am on the home page") do
  visit root_path
  click_button('Join us')
end

When('I click on Sign In with {string}') do |provider|
  visit root_path

  # Set up OmniAuth mock
  if provider == 'Facebook'
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: '374543',
      info: {
        email: 'test@example.com',
        name: 'Test User'
      }
    })
  elsif provider == 'Google'
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '374543',
      info: {
        email: 'test@example.com',
        name: 'Test User'
      }
    })
  end

  find('#'+provider.downcase+'Button').click

end

And("I submit the registration form") do

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
  if provider == 'Facebook'
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: '374543',
      info: {
        email: 'test@example.com',
        name: 'Test User'
      }
    })
  elsif provider == 'Google'
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '374543',
      info: {
        email: 'test@example.com',
        name: 'Test User'
      }
    })
  end

  # Visit the OmniAuth callback URL
  if provider == 'Facebook'
    visit "users/auth/facebook/callback"
  elsif provider == 'Google'
    visit "users/auth/google_oauth2/callback"
  end

  # Perform any additional actions needed for your application
  if has_selector?('#selectedTeamId', visible: false)
    find('#selectedTeamId', visible: false).set('1')
    click_button('Create User')
  end

  # Ensure the user is redirected to the dashboard page
  visit user_dashboard_path
  expect(page).to have_current_path(user_dashboard_path)
end
