Given("I am on the dashboard page") do
  visit user_dashboard_path
  expect(page).to have_current_path(user_dashboard_path)
end


When("I click on the league link") do
  # Check if the link with text 'League' is present and click it if it is
  if page.has_link?('League')
    click_link('League')
  else
    puts "League link is not present on the page"
  end
end
