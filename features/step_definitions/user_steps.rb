
Given("I am on the home page") do
  visit root_path
end

When("I click on {string}") do |button|
  click_button button
end

When("I submit the registration form") do
  expect(page).to have_current_path(new_user_path)
  fill_in 'user_bio', with: 'Sample Bio'
  click_button('Create User')
end

Then("I should be on the dashboard page") do
  puts "Current path: #{current_path}"
  expect(page).to have_current_path(user_dashboard_path)
end
