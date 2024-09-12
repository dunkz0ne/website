# features/step_definitions/signup_steps.rb

Given('{string} on the sign up page') do |name|
  visit 'users/sign_up' # Assuming you're using Capybara to visit the page
end

When('{string} doesn\'t fill all field') do |name|
  @team = Team.first

  select @team.name, from: 'user_team_id'
  fill_in 'user_name', with: ''
  fill_in 'user_password', with: ''
  fill_in 'user_password_confirmation', with: ''
  fill_in 'user_bio', with: 'I am a test'
  attach_file('user_photo', Rails.root.join('features', 'files', 'test_image.png'))

end

When('{string} choices a too easy password') do |name|
  visit 'users/sign_up'
  @team = Team.first
  select @team.name, from: 'user_team_id'
  fill_in 'user_name', with: @user[:name]
  fill_in 'user_email', with: @user[:email]
  fill_in 'user_password', with: '1234'
  fill_in 'user_password_confirmation', with: '1234'
  fill_in 'user_bio', with: 'I am a test'
  attach_file('user_photo', Rails.root.join('features', 'files', 'test_image.png'))
end

And('{string} submits the sign up form') do |name|
  click_button 'Sign Up'
end

Then('{string} should see an error message') do |name|
  expect(page).to have_css('#new_user > div > div > div > div > div.card-body > div:nth-child(6) > div:nth-child(1)')
end


When("{string} fill the sign up form") do |name|
  visit 'users/sign_up'
  @team = Team.first
  select @team.name, from: 'user_team_id'
  fill_in 'user_name', with: @user[:name]
  fill_in 'user_email', with: @user[:email]
  fill_in 'user_password', with: @user[:password]
  fill_in 'user_password_confirmation', with: @user[:password]
  fill_in 'user_bio', with: 'I am a test'
  attach_file('user_photo', Rails.root.join('features', 'files', 'test_image.png'))
end

Then('{string} should be on the dashboard page') do |name|
  expect(page).to have_current_path(user_dashboard_path)
end


Given('a potential user named {string}') do |name|
  @user = { name: name }
end

And('{string} has an email named {string}') do |name, email|
  @user[:email] = email
end

And('{string} has an NBA favorite team named {string}') do |name, team|
  @user[:team_name] = team
end

And('{string} has a password named {string}') do |name, password|
  @user[:password] = password
end
