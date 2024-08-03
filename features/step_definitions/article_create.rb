Given("I am a Journalist") do
  # Create or fetch a journalist user
  @user = User.find_by(email: 'test@example.com')
  @journalist = @user.become_journalist!
end

When("I click on the New Article link") do
  # Navigate to the new article page
  visit new_article_path
end

When("I submit the article form") do
  # Fill in and submit the article form
  fill_in 'Title', with: 'Test Article Title'
  fill_in 'Content', with: 'This is the content of the test article.'
  click_button 'Create Article'
end

Then("I should see the article in the list of articles") do
  # Verify that the article appears in the list
  expect(page).to have_content('Test Article Title')
  expect(page).to have_content('This is the content of the test article.')
end
