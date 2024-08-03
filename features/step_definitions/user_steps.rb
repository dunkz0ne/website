Given("I am on the home page") do
  visit root_path
end

When("I click on {string}") do |button|
  click_button button
end

When("I submit the registration form") do

  # Verify that you are on the registration page
  expect(page).to have_current_path(new_user_path)

  # Select first team
  @team = Team.first()

  Rails.logger.debug "Team: #{@team.inspect}"

  # Fill in the form
  select @team.name, from: 'user_team_id'  # Assicurati che il 'from' corrisponda al name dell'elemento select
  fill_in 'user_bio', with: 'I am a test'
  attach_file('user_photo', Rails.root.join('features', 'files', 'test_image.png'))

  # Verify that the button to create the user is present
  expect(page).to have_button('Create User')

  #  Click the button to create the user
  click_button('Create User')
end

Then("I should be on the dashboard page") do
  # Verify that you are on the dashboard page
  expect(page).to have_current_path(user_dashboard_path)
end
