Given("a team named {string} exists") do |team_name|
  @team = Team.first()
end

Given("I am on the home page") do
  visit root_path
  #puts "Team: #{@team.inspect}"
end

When("I click on {string}") do |button|
  click_button button
end

When("I submit the registration form") do

  # Verifica che sei sulla pagina di creazione dell'utente
  expect(page).to have_current_path(new_user_path)

  select @team.name, from: 'user_team_id'  # Assicurati che il 'from' corrisponda al name dell'elemento select
  fill_in 'user_bio', with: 'I am a test'

  # Verifica che il pulsante sia presente
  expect(page).to have_button('Create User')

  # Clicca sul pulsante per creare l'utente
  click_button('Create User')
end

Then("I should be on the dashboard page") do
  # Stampa il percorso corrente per il debugging
  puts "Current path: #{current_path}"

  # Verifica che sei sulla pagina della dashboard
  expect(page).to have_current_path(user_dashboard_path)
end
