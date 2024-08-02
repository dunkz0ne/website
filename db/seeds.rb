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

# Create users
users = [
    { name: 'Cristian Apostol', email: 'cristian@gmail.com', team_id: 5, provider: 'facebook' },
    { name: 'Pietro Costanzi Fantini', email: 'pietro@cf.com', team_id: 1, provider: 'facebook' },
    { name: 'Luca Rossi', email: 'luca.rossi@gmail.com', team_id: 2, provider: 'google' },
    { name: 'Giulia Bianchi', email: 'giulia.bianchi@yahoo.com', team_id: 3, provider: 'github' },
    { name: 'Alessandro Verdi', email: 'alessandro.verdi@hotmail.com', team_id: 4, provider: 'twitter' },
    { name: 'Maria Ferrari', email: 'maria.ferrari@gmail.com', team_id: 2, provider: 'google' },
    { name: 'Francesco Russo', email: 'francesco.russo@outlook.com', team_id: 1, provider: 'facebook' },
    { name: 'Elena Neri', email: 'elena.neri@gmail.com', team_id: 5, provider: 'linkedin' },
    { name: 'Marco Gentile', email: 'marco.gentile@yahoo.com', team_id: 3, provider: 'google' },
    { name: 'Sara Colombo', email: 'sara.colombo@gmail.com', team_id: 4, provider: 'github' }
]

# Create journalists
journalists = [
    { name: 'Andrea De Luca', email: 'andrea.deluca@news.com', team_id: 1, provider: 'linkedin' },
    { name: 'Valentina Mariani', email: 'valentina.mariani@journal.com', team_id: 2, provider: 'twitter' },
    { name: 'Roberto Conti', email: 'roberto.conti@media.com', team_id: 3, provider: 'facebook' },
    { name: 'Chiara Galli', email: 'chiara.galli@press.com', team_id: 4, provider: 'google' },
    { name: 'Matteo Ricci', email: 'matteo.ricci@reporter.com', team_id: 5, provider: 'github' },
    { name: 'Laura Lombardi', email: 'laura.lombardi@editor.com', team_id: 6, provider: 'twitter' },
    { name: 'Stefano Ferrari', email: 'stefano.ferrari@newsnet.com', team_id: 7, provider: 'linkedin' },
    { name: 'Francesca Greco', email: 'francesca.greco@daily.com', team_id: 8, provider: 'google' },
    { name: 'Paolo Rinaldi', email: 'paolo.rinaldi@headlines.com', team_id: 9, provider: 'facebook' },
    { name: 'Silvia Russo', email: 'silvia.russo@worldnews.com', team_id: 10, provider: 'github' }
]

# Create articles
journalists_articles = [
  {
    journalist: 'Andrea De Luca',
    articles: [
      { title: 'La rinascita degli Atlanta Hawks', content: 'Gli Atlanta Hawks stanno mostrando un grande potenziale nella stagione attuale. Esploriamo le chiavi del loro successo.', draft: false },
      { title: 'Trae Young: Il leader degli Hawks', content: 'Una panoramica sull\'influenza di Trae Young nel gioco degli Hawks e il suo impatto sulla squadra.', draft: false }
    ]
  },
  {
    journalist: 'Valentina Mariani',
    articles: [
      { title: 'Il ritorno dei Boston Celtics', content: 'Un\'analisi su come i Celtics stanno cercando di tornare tra le squadre top della NBA.', draft: false },
      { title: 'Jayson Tatum: Una stella nascente', content: 'Esploriamo la crescita e l\'impatto di Jayson Tatum sui Boston Celtics.', draft: false }
    ]
  },
  {
    journalist: 'Roberto Conti',
    articles: [
      { title: 'Brooklyn Nets: Una potenza in crescita', content: 'Con stelle come Kevin Durant e Kyrie Irving, i Nets stanno costruendo una squadra formidabile.', draft: false },
      { title: 'La strategia offensiva dei Nets', content: 'Come i Brooklyn Nets stanno dominando con il loro gioco offensivo.', draft: false }
    ]
  },
  {
    journalist: 'Chiara Galli',
    articles: [
      { title: 'La metamorfosi dei Charlotte Hornets', content: 'Un\'analisi delle recenti modifiche e del progresso dei Charlotte Hornets.', draft: false },
      { title: 'LaMelo Ball: Il futuro degli Hornets', content: 'Il giovane LaMelo Ball sta emergendo come una delle stelle del futuro per Charlotte.', draft: false }
    ]
  },
  {
    journalist: 'Matteo Ricci',
    articles: [
      { title: 'Chicago Bulls: Ritorno alla gloria?', content: 'Un\'analisi dei Chicago Bulls e delle loro possibilità di ritornare ai vertici.', draft: false },
      { title: 'La crescita di Zach LaVine', content: 'Esploriamo il ruolo chiave di Zach LaVine e la sua crescita come giocatore.', draft: false }
    ]
  },
  {
    journalist: 'Laura Lombardi',
    articles: [
      { title: 'Cleveland Cavaliers: Una nuova era', content: 'Con giovani talenti e nuove strategie, i Cavaliers stanno cercando di costruire una nuova era di successo.', draft: false },
      { title: 'Il contributo di Darius Garland', content: 'Darius Garland sta emergendo come uno dei giocatori chiave per i Cleveland Cavaliers.', draft: false }
    ]
  },
  {
    journalist: 'Stefano Ferrari',
    articles: [
      { title: 'Dallas Mavericks: Luka Dončić e il suo impatto', content: 'L\'incredibile impatto di Luka Dončić sui Dallas Mavericks e le loro prospettive future.', draft: false },
      { title: 'Strategie difensive dei Mavericks', content: 'Un\'analisi di come i Mavericks stanno migliorando la loro difesa.', draft: false }
    ]
  },
  {
    journalist: 'Francesca Greco',
    articles: [
      { title: 'Denver Nuggets: La forza del collettivo', content: 'Esploriamo come i Nuggets stiano costruendo una squadra forte grazie al gioco di squadra.', draft: false },
      { title: 'Nikola Jokić: Il pilastro dei Nuggets', content: 'L\'importanza di Nikola Jokić per i Denver Nuggets e il suo ruolo di leader.', draft: false }
    ]
  },
  {
    journalist: 'Paolo Rinaldi',
    articles: [
      { title: 'Detroit Pistons: Costruire per il futuro', content: 'I Pistons stanno cercando di costruire una squadra per il futuro con giovani talenti promettenti.', draft: false },
      { title: 'Il ruolo di Cade Cunningham', content: 'Cade Cunningham sta emergendo come un giocatore chiave per il futuro dei Pistons.', draft: false }
    ]
  },
  {
    journalist: 'Silvia Russo',
    articles: [
      { title: 'Golden State Warriors: Un ritorno dominante', content: 'I Warriors stanno ritornando al loro livello di gioco dominante. Analizziamo i motivi.', draft: false },
      { title: 'Steph Curry: Il cuore dei Warriors', content: 'Steph Curry continua a essere il fulcro dell\'offensiva dei Warriors con prestazioni straordinarie.', draft: false }
    ]
  }
]


team_managers = [
  { name: 'Giovanni Bernardi', email: 'giovanni.bernardi@team.com', team_id: 1, provider: 'linkedin' },
  { name: 'Federica Romano', email: 'federica.romano@team.com', team_id: 2, provider: 'twitter' },
  { name: 'Luigi Conti', email: 'luigi.conti@team.com', team_id: 3, provider: 'facebook' },
  { name: 'Elisa Marchetti', email: 'elisa.marchetti@team.com', team_id: 4, provider: 'google' },
  { name: 'Marco Esposito', email: 'marco.esposito@team.com', team_id: 5, provider: 'github' },
  { name: 'Sabrina Ricci', email: 'sabrina.ricci@team.com', team_id: 6, provider: 'twitter' },
  { name: 'Matteo Bianchi', email: 'matteo.bianchi@team.com', team_id: 7, provider: 'linkedin' },
  { name: 'Alice Neri', email: 'alice.neri@team.com', team_id: 8, provider: 'google' },
  { name: 'Paolo Moretti', email: 'paolo.moretti@team.com', team_id: 9, provider: 'facebook' },
  { name: 'Sara Lombardi', email: 'sara.lombardi@team.com', team_id: 10, provider: 'github' }
]

team_manager_releases = [
  {
    team_manager: 'Giovanni Bernardi',
    releases: [
      { title: 'Aggiornamenti sugli Atlanta Hawks', content: 'Gli Atlanta Hawks annunciano i nuovi sviluppi della squadra, inclusi gli infortuni e le ultime strategie.' },
      { title: 'Atlanta Hawks: Piani per la Stagione', content: 'Una dichiarazione sui piani futuri degli Atlanta Hawks e gli obiettivi per la stagione in corso.' }
    ]
  },
  {
    team_manager: 'Federica Romano',
    releases: [
      { title: 'Novità dai Boston Celtics', content: 'I Boston Celtics rilasciano un comunicato sui cambiamenti nel roster e le nuove acquisizioni.' },
      { title: 'Piano di Rinnovamento dei Celtics', content: 'Discussione sul piano di rinnovamento della squadra per migliorare le prestazioni in campo.' }
    ]
  },
  {
    team_manager: 'Luigi Conti',
    releases: [
      { title: 'Brooklyn Nets: Stato della Squadra', content: 'Un aggiornamento sulla condizione attuale della squadra e dei giocatori dei Brooklyn Nets.' },
      { title: 'Nuove Strategie dei Nets', content: 'Il management dei Nets discute le nuove strategie implementate per migliorare il gioco.' }
    ]
  },
  {
    team_manager: 'Elisa Marchetti',
    releases: [
      { title: 'Charlotte Hornets: Comunicato Ufficiale', content: 'Dichiarazione ufficiale dei Charlotte Hornets su recenti sviluppi e iniziative della squadra.' },
      { title: 'Hornets: Focus sullo Sviluppo Giovanile', content: 'La squadra evidenzia il loro impegno nel sviluppo dei giovani talenti.' }
    ]
  },
  {
    team_manager: 'Marco Esposito',
    releases: [
      { title: 'Chicago Bulls: Comunicato Stampa', content: 'I Chicago Bulls discutono i loro piani per la stagione e le nuove strategie.' },
      { title: 'Focus sui Nuovi Acquisti dei Bulls', content: 'Presentazione dei nuovi giocatori acquisiti dai Bulls e il loro potenziale impatto.' }
    ]
  },
  {
    team_manager: 'Sabrina Ricci',
    releases: [
      { title: 'Cleveland Cavaliers: Notizie dal Front Office', content: 'Aggiornamenti dal front office dei Cavaliers riguardo le condizioni della squadra e dei giocatori.' },
      { title: 'Cavaliers: Strategia di Costruzione per il Futuro', content: 'La squadra discute le loro strategie per costruire un futuro solido e competitivo.' }
    ]
  },
  {
    team_manager: 'Matteo Bianchi',
    releases: [
      { title: 'Dallas Mavericks: Comunicato Stampa', content: 'Il management dei Mavericks annuncia gli ultimi aggiornamenti e le strategie per la stagione.' },
      { title: 'Luka Dončić e il Futuro dei Mavericks', content: 'Discussione sull\'importanza di Luka Dončić per il futuro della squadra.' }
    ]
  },
  {
    team_manager: 'Alice Neri',
    releases: [
      { title: 'Denver Nuggets: Aggiornamenti Ufficiali', content: 'Dichiarazione ufficiale sui recenti sviluppi nella squadra dei Nuggets.' },
      { title: 'Nikola Jokić: La Star dei Nuggets', content: 'Il management parla dell\'importanza di Nikola Jokić e della sua leadership nella squadra.' }
    ]
  },
  {
    team_manager: 'Paolo Moretti',
    releases: [
      { title: 'Detroit Pistons: Comunicato dal Front Office', content: 'Il front office dei Pistons discute le recenti mosse e le prospettive future.' },
      { title: 'Pistons: Strategie di Ricostruzione', content: 'Discussione sui piani di ricostruzione e le prospettive per il futuro della squadra.' }
    ]
  },
  {
    team_manager: 'Sara Lombardi',
    releases: [
      { title: 'Golden State Warriors: Dichiarazione Ufficiale', content: 'Dichiarazione ufficiale sui recenti successi e sfide per i Golden State Warriors.' },
      { title: 'Strategie Future dei Warriors', content: 'Discussione sulle strategie future della squadra per mantenere il loro successo.' }
    ]
  }
]


teams.each do |team|
    Team.create(name: team[:name], color: team[:color], api: team[:api])
end

users.each do |user|
    User.create(name: user[:name], email: user[:email], team_id: user[:team_id], provider: user[:provider])
end

journalists.each do |journalist|
    Journalist.create(name: journalist[:name], email: journalist[:email], team_id: journalist[:team_id], provider: journalist[:provider])
end

journalists_articles.each do |journalist_articles|
    journalist = Journalist.find_by(name: journalist_articles[:journalist])
    journalist_articles[:articles].each do |article|
        journalist.articles.create(title: article[:title], content: article[:content], draft: article[:draft])
    end
end

team_managers.each do |team_manager|
    TeamManager.create(name: team_manager[:name], email: team_manager[:email], team_id: team_manager[:team_id], provider: team_manager[:provider])
end

team_manager_releases.each do |team_manager_releases|
    team_manager = TeamManager.find_by(name: team_manager_releases[:team_manager])
    team_manager_releases[:releases].each do |release|
        team_manager.releases.create(title: release[:title], content: release[:content])
    end
end



# Creazione di un utente generico
u = User.create!(name: 'Silvia Russo', email: 'silvia.russo@worldnews.com', team_id: 10, provider: 'github')
u1 = User.first();

certificate_path = Rails.root.join('db','Among-Us-Logo.png')

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
