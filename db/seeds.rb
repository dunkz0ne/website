# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create teams
teams = [
    { name: 'Atlanta Hawks', color: '#E03A3E', api: '1610612737' },
    { name: 'Boston Celtics', color: '#007A33', api: '1610612738' },
    { name: 'Brooklyn Nets', color: '#000000', api: '1610612751' },
    { name: 'Charlotte Hornets', color: '#1D1160', api: '1610612766' },
    { name: 'Chicago Bulls', color: '#CE1141', api: '1610612741' },
    { name: 'Cleveland Cavaliers', color: '#860038', api: '1610612739' },
    { name: 'Dallas Mavericks', color: '#00538C', api: '1610612742' },
    { name: 'Denver Nuggets', color: '#0E2240', api: '1610612743' },
    { name: 'Detroit Pistons', color: '#C8102E', api: '1610612765' },
    { name: 'Golden State Warriors', color: '#1D428A', api: '1610612744' },
    { name: 'Houston Rockets', color: '#CE1141', api: '1610612745' },
    { name: 'Indiana Pacers', color: '#002D62', api: '1610612754' },
    { name: 'LA Clippers', color: '#C8102E', api: '1610612746' },
    { name: 'Los Angeles Lakers', color: '#552583', api: '1610612747' },
    { name: 'Memphis Grizzlies', color: '#5D76A9', api: '1610612763' },
    { name: 'Miami Heat', color: '#98002E', api: '1610612748' },
    { name: 'Milwaukee Bucks', color: '#00471B', api: '1610612749' },
    { name: 'Minnesota Timberwolves', color: '#0C2340', api: '1610612750' },
    { name: 'New Orleans Pelicans', color: '#0C2340', api: '1610612740' },
    { name: 'New York Knicks', color: '#006BB6', api: '1610612752' },
    { name: 'Oklahoma City Thunder', color: '#007AC1', api: '1610612760' },
    { name: 'Orlando Magic', color: '#0077C0', api: '1610612753' },
    { name: 'Philadelphia 76ers', color: '#006BB6', api: '1610612755' },
    { name: 'Phoenix Suns', color: '#1D1160', api: '1610612756' },
    { name: 'Portland Trail Blazers', color: '#E03A3E', api: '1610612757' },
    { name: 'Sacramento Kings', color: '#5A2D81', api: '1610612758' },
    { name: 'San Antonio Spurs', color: '#C4CED4', api: '1610612759' },
    { name: 'Toronto Raptors', color: '#CE1141', api: '1610612761' },
    { name: 'Utah Jazz', color: '#002B5C', api: '1610612762' },
    { name: 'Washington Wizards', color: '#002B5C', api: '1610612764' }
]

teams.each do |team|
    Team.create(name: team[:name], color: team[:color], api: team[:api])
end

user1 = User.create!(name: "Cristian Apo", email: "ciao@gmail.com", team_id: 5, provider: "facebook")

user2 = Journalist.create!(name: "Cristian Apo", email: "ciaooo@gmai.com", team_id: 5, provider: "facebook")

article = user1.articles.create!(title: "Article 1", content: "Content 1")
