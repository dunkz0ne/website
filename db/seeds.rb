# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'securerandom'

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

# Crea gli utenti
users = [
  { name: 'Cristian Apostol', email: 'cristian@gmail.com', team_id: 5, provider: 'facebook' },
  { name: 'Pietro Costanzi Fantini', email: 'pietro@cf.com', team_id: 1, provider: 'facebook' },
  { name: 'Luca Rossi', email: 'luca.rossi@gmail.com', team_id: 2, provider: 'google' },
  { name: 'Elena Neri', email: 'elena.neri@gmail.com', team_id: 5, provider: 'linkedin' },
  { name: 'Marco Gentile', email: 'marco.gentile@yahoo.com', team_id: 3, provider: 'google' },
  { name: 'Sara Colombo', email: 'sara.colombo@gmail.com', team_id: 4, provider: 'github' },
  { name: 'Giulia Bianchi', email: 'giulia.bianchi@yahoo.com', team_id: 3, provider: 'email' },
  { name: 'Alessandro Verdi', email: 'alessandro.verdi@hotmail.com', team_id: 4, provider: 'email' },
  { name: 'Maria Ferrari', email: 'maria.ferrari@gmail.com', team_id: 2, provider: 'email' },
  { name: 'Francesco Russo', email: 'francesco.russo@outlook.com', team_id: 1, provider: 'email' }
]

# Create journalists
journalists = [
  { name: 'Andrea De Luca', email: 'andrea.deluca@news.com', team_id: 1, provider: 'linkedin'},
  { name: 'Valentina Mariani', email: 'valentina.mariani@journal.com', team_id: 2, provider: 'twitter' },
  { name: 'Roberto Conti', email: 'roberto.conti@media.com', team_id: 3, provider: 'facebook' },
  { name: 'Chiara Galli', email: 'chiara.galli@press.com', team_id: 4, provider: 'google' },
  { name: 'Matteo Ricci', email: 'matteo.ricci@reporter.com', team_id: 5, provider: 'github' },
  { name: 'Laura Lombardi', email: 'laura.lombardi@editor.com', team_id: 6, provider: 'twitter' },
  { name: 'Stefano Ferrari', email: 'stefano.ferrari@newsnet.com', team_id: 7, provider: 'email' },
  { name: 'Francesca Greco', email: 'francesca.greco@daily.com', team_id: 8, provider: 'email' },
  { name: 'Paolo Rinaldi', email: 'paolo.rinaldi@headlines.com', team_id: 9, provider: 'email' },
  { name: 'Silvia Russo', email: 'silvia.russo@worldnews.com', team_id: 10, provider: 'email'}
]

# Create team managers
team_managers = [
  { name: 'Giovanni Bernardi', email: 'giovanni.bernardi@team.com', team_id: 1, provider: 'linkedin' },
  { name: 'Federica Romano', email: 'federica.romano@team.com', team_id: 2, provider: 'twitter' },
  { name: 'Luigi Conti', email: 'luigi.conti@team.com', team_id: 3, provider: 'facebook' },
  { name: 'Elisa Marchetti', email: 'elisa.marchetti@team.com', team_id: 4, provider: 'google' },
  { name: 'Marco Esposito', email: 'marco.esposito@team.com', team_id: 5, provider: 'github' },
  { name: 'Sabrina Ricci', email: 'sabrina.ricci@team.com', team_id: 6, provider: 'email' },
  { name: 'Matteo Bianchi', email: 'matteo.bianchi@team.com', team_id: 7, provider: 'email' },
  { name: 'Alice Neri', email: 'alice.neri@team.com', team_id: 8, provider: 'email' },
  { name: 'Paolo Moretti', email: 'paolo.moretti@team.com', team_id: 9, provider: 'email' },
  { name: 'Sara Lombardi', email: 'sara.lombardi@team.com', team_id: 10, provider: 'email' }
]

# Create articles
journalists_articles = [
  {
    journalist: 'Andrea De Luca',
    articles: [
      { title: 'La rinascita degli Atlanta Hawks', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: true },
      { title: 'Trae Young: Il leader degli Hawks', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Valentina Mariani',
    articles: [
      { title: 'Il ritorno dei Boston Celtics', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia..', draft: false },
      { title: 'Jayson Tatum: Una stella nascente', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Roberto Conti',
    articles: [
      { title: 'Brooklyn Nets: Una potenza in crescita', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'La strategia offensiva dei Nets', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Chiara Galli',
    articles: [
      { title: 'La metamorfosi dei Charlotte Hornets', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'LaMelo Ball: Il futuro degli Hornets', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Matteo Ricci',
    articles: [
      { title: 'Chicago Bulls: Ritorno alla gloria?', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'La crescita di Zach LaVine', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Laura Lombardi',
    articles: [
      { title: 'Cleveland Cavaliers: Una nuova era', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'Il contributo di Darius Garland', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Stefano Ferrari',
    articles: [
      { title: 'Dallas Mavericks: Luka Dončić e il suo impatto', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'Strategie difensive dei Mavericks', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Francesca Greco',
    articles: [
      { title: 'Denver Nuggets: La forza del collettivo', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'Nikola Jokić: Il pilastro dei Nuggets', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia..', draft: false }
    ]
  },
  {
    journalist: 'Paolo Rinaldi',
    articles: [
      { title: 'Detroit Pistons: Costruire per il futuro', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'Il ruolo di Cade Cunningham', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  },
  {
    journalist: 'Silvia Russo',
    articles: [
      { title: 'Golden State Warriors: Un ritorno dominante', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false },
      { title: 'Steph Curry: Il cuore dei Warriors', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.', draft: false }
    ]
  }
]

team_manager_releases = [
  {
    team_manager: 'Giovanni Bernardi',
    releases: [
      { title: 'Aggiornamenti sugli Atlanta Hawks', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' },
      { title: 'Atlanta Hawks: Piani per la Stagione', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Federica Romano',
    releases: [
      { title: 'Novità dai Boston Celtics', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' },
      { title: 'Piano di Rinnovamento dei Celtics', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Luigi Conti',
    releases: [
      { title: 'Brooklyn Nets: Stato della Squadra', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' },
      { title: 'Nuove Strategie dei Nets', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Elisa Marchetti',
    releases: [
      { title: 'Charlotte Hornets: Comunicato Ufficiale', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' },
      { title: 'Hornets: Focus sullo Sviluppo Giovanile', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Marco Esposito',
    releases: [
      { title: 'Chicago Bulls: Comunicato Stampa', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' },
      { title: 'Focus sui Nuovi Acquisti dei Bulls', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Sabrina Ricci',
    releases: [
      { title: 'Cleveland Cavaliers: Notizie dal Front Office', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' },
      { title: 'Cavaliers: Strategia di Costruzione per il Futuro', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Matteo Bianchi',
    releases: [
      { title: 'Dallas Mavericks: Comunicato Stampa', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia..' },
      { title: 'Luka Dončić e il Futuro dei Mavericks', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Alice Neri',
    releases: [
      { title: 'Denver Nuggets: Aggiornamenti Ufficiali', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia..' },
      { title: 'Nikola Jokić: La Star dei Nuggets', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Paolo Moretti',
    releases: [
      { title: 'Detroit Pistons: Comunicato dal Front Office', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia..' },
      { title: 'Pistons: Strategie di Ricostruzione', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  },
  {
    team_manager: 'Sara Lombardi',
    releases: [
      { title: 'Golden State Warriors: Dichiarazione Ufficiale', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' },
      { title: 'Strategie Future dei Warriors', content: 'Ad excepteur irure sit magna aliqua pariatur magna deserunt velit dolore amet. Irure irure aliqua do reprehenderit eiusmod culpa ipsum duis aliquip reprehenderit. Sunt labore nisi dolore aliquip fugiat quis enim aliquip et consequat id nisi.
Est tempor tempor nostrud occaecat velit veniam elit sunt quis amet aliquip sint aute. Nostrud nostrud pariatur ea mollit id voluptate pariatur irure fugiat qui labore enim. Laboris qui adipisicing et ad officia in velit sunt. Anim irure consectetur nulla incididunt enim ut.

Deserunt non laborum id esse consequat. Qui minim sint id cupidatat magna excepteur enim incididunt amet excepteur adipisicing irure. Ea duis cupidatat ipsum fugiat sit. Ad ut deserunt mollit ut. Ad duis minim laborum aute. Consectetur nostrud officia in non ipsum eiusmod aliquip laborum culpa magna minim. Voluptate aliquip exercitation cupidatat sit quis culpa velit.

Ea ullamco labore aliquip officia voluptate laboris officia ut ad in Lorem quis qui veniam. Incididunt amet minim labore ad eiusmod deserunt ea aute excepteur non nisi labore. Cillum sint nulla aute veniam occaecat cupidatat ea pariatur magna sint nisi. Velit nisi ut minim dolore anim nostrud proident.

Non elit voluptate fugiat enim officia qui. Excepteur esse sit fugiat mollit laborum incididunt cillum. Cupidatat voluptate eiusmod exercitation tempor deserunt adipisicing occaecat ut aliquip.

Labore tempor nulla laboris elit incididunt laboris amet eiusmod. Culpa ullamco incididunt est eiusmod amet ex quis eu. Aliqua nisi anim veniam nostrud sit sunt esse duis. Irure mollit veniam id qui labore laboris ex. Incididunt tempor officia id et Lorem cillum nisi et nulla dolore. Velit exercitation adipisicing minim aliqua amet officia Lorem elit quis cupidatat laborum nisi consectetur. Ipsum do deserunt dolor excepteur do commodo deserunt cupidatat excepteur tempor velit officia.' }
    ]
  }
]


teams.each do |team|
    Team.create(name: team[:name], color: team[:color], api: team[:api])
end

users.each do |user|
    User.create( name: user[:name], email: user[:email], team_id: user[:team_id], provider: user[:provider], password: 'password123', password_confirmation: 'password123')
end

journalists.each do |journalist|
    Journalist.create(name: journalist[:name], email: journalist[:email], team_id: journalist[:team_id], provider: journalist[:provider], password: 'password123', password_confirmation: 'password123')
end

team_managers.each do |team_manager|
    TeamManager.create(name: team_manager[:name], email: team_manager[:email], team_id: team_manager[:team_id], provider: team_manager[:provider], password: 'password123', password_confirmation: 'password123')
end

journalists_articles.each do |journalist_articles|
    journalist = Journalist.find_by(name: journalist_articles[:journalist])
    journalist_articles[:articles].each do |article|
        journalist.articles.create(title: article[:title], content: article[:content], draft: article[:draft], team_id: journalist.team_id)
    end
end

team_manager_releases.each do |team_manager_releases|
    team_manager = TeamManager.find_by(name: team_manager_releases[:team_manager])
    team_manager_releases[:releases].each do |release|
        team_manager.releases.create(title: release[:title], content: release[:content], team_id: team_manager.team_id)
    end
end

# Journalist requests
u = User.first();
u1 = User.second();

certificate_path = Rails.root.join('db','Among-Us.pdf')

if File.exist?(certificate_path)
  journalist_request = JournalistRequest.create!(
    user: u,
    certificate: {
      io: File.open(certificate_path),
      filename: 'certificate.pdf',
      content_type: 'application/pdf'
    }
  )
else
  puts "File certificate.pdf non trovato in db"
end

if File.exist?(certificate_path)
  journalist_request = JournalistRequest.create!(
    user: u1,
    certificate: {
      io: File.open(certificate_path),
      filename: 'certificate.pdf',
      content_type: 'application/pdf'
    }
  )
else
  puts "File certificate.pdf non trovato in db"
end
