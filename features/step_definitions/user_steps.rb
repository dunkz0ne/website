Given("I am on the home page") do
  visit root_path
end

When("I click on Sign In with Facebook") do
  click_button('Sign In with Facebook')
end

When("I submit the registration form") do
  expect(page).to have_current_path(new_user_path)

  @team = Team.first

  select @team.name, from: 'user_team_id'
  fill_in 'user_bio', with: 'I am a test'
  attach_file('user_photo', Rails.root.join('features', 'files', 'test_image.png'))

  expect(page).to have_button('Create User')
  click_button('Create User')
end

Then("I should be on the dashboard page") do
  expect(page).to have_current_path(user_dashboard_path)
end

Given("I am logged in with Facebook") do
  # Set up OmniAuth mock
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    provider: 'facebook',
    uid: '123456',
    info: {
      email: 'test@example.com',
      name: 'Test User'
    }
  })

  # Visit the sign in path
  visit auth_facebook_callback_path

  if page.has_button?('Create User')
    click_button('Create User')
  end

  visit user_dashboard_path

  # Ensure the user is redirected to the dashboard page
  expect(page).to have_current_path(user_dashboard_path)
end

Then("print the current path") do
  puts "Current path: #{current_path}"
end
