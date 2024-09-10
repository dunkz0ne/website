Given("I am on article page") do
  # Create or fetch a user
  @user = User.find_by(email: 'test@example.com')
  @article = @articles = Article.first
  visit article_path(@article)
  expect(page).to have_current_path(article_path(@article))
end

When("I submit the form") do
  expect(page).to have_content('Content')
  # Fill in and submit the form
  fill_in 'Content', with: 'This is the comment of the test article.'
  find('input[type="submit"]').click
end

Then("I should view the comment") do
  # Verify that the comment appears
  expect(page).to have_content('This is the comment of the test article.')
end

And("click on like and save button") do
  find('#comments > div > a:nth-child(5)').click
  find('#comments > div > a:nth-child(6)').click
end

When("I visit profile page") do
  visit user_path(@user)
  expect(page).to have_content('This is the comment of the test article.')
end
