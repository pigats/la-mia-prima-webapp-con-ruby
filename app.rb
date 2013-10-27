require 'sinatra'

configure do
  set :talks, [
  {time: '9.30 – 9.40',   title: 'Introduzione al Linux Day', speaker: 'Marco Oggioni, Presidente FSUG Padova'},
  {time: '9.35 – 9.40',   title: 'Saluto del Dirigente Scolastico', speaker: 'Prof. Roberto Borile, Dirigente Scolastico Liceo A. Modigliani'},
  {time: '9.40 – 9.50',   title: 'Saluto dei supporter del Linux Day 2013'},
  {time: '9.50 – 9.55',   title: 'Illustrazione programma Linux Day 2013', speaker: 'Marco Oggioni'},
  {time: '9.55 – 10.15',  title: 'Storia del software libero', speaker: 'Ing. Alessandro Gardich, FSUG Padova'},
  {time: '10.10 – 10.25', title: 'Costruisci il tuo mondo in 3D: Le stampanti 3D', speaker: 'Marco Calegaro, Open Hardware Developer'},
  {time: '10.25 – 10.50', title: 'Il Software Libero nella Scuola: il caso Modigliani', speaker: 'Dario Freddi'},
  {time: '11.15 – 11.45', title: 'GARR-X, la Rete italiana dell’Istruzione e della Ricerca', speaker: 'Claudio Allocchio (GARR, Gruppo per l’Armonizzazione delle Reti della Ricerca)'},
  {time: '11.45 – 12.15', title: 'OpenSource nel Comune di Padova: lo stato delle cose', speaker: 'Alberto Corò, Responsabile Sistemi Informatici del Comune di Padova'},
  {time: '12.15 – 12.45', title: 'L‘accesso aperto nella Didattica (OpenAccess)', speaker: 'Antonella De Robbio, Università di Padova'},
  {time: '14.30 – 14.40', title: 'Illustrazione programma Linux Day 2013', speaker: 'Marco Oggioni'},
  {time: '14.30 – 15.00', title: 'La mia prima applicazione web con ruby in 30 min', speaker: 'Andrea Pigato', file: 'la_mia_prima_webapp_con_ruby.pdf'},
  {time: '14.40 – 15.30', title: 'Software libero nella PMI', speaker: 'Pierpaolo Toniolo, FSUG Padova'},
  {time: '15.00 – 16.00', title: 'SUSE STUDIO', speaker: 'Flavio Castelli, Software Engineer SUSE'},
  {time: 'dalle 15.30',   title: 'Laboratorio su ARDUINO', speaker: 'Filippo Maschietto'},
  {time: '15.30 – 16.00', title: 'Joomla', speaker: 'Nicola Rampazzo'},
  {time: '16.00 – 16.30', title: 'LaTeX', speaker: 'Antonio Dalvit'},
  {time: '16.00 – 16.40', title: 'BASH Tips&Tricks', speaker: 'Alessandro Costa, Software Engineer'},
  {time: '16.40 – 17.25', title: 'GitHub', speaker: 'Ing. Yvette Agostini'},
  {time: '16.50 – 17.30', title: 'Fai suonare il tuo Linux 2.0!', speaker: 'Antonio Passamani'},
  {time: '17.25 – 18.00', title: 'RaspberryPI + Mer + QML = fun', speaker: 'Davide Bettio, KDE Developer, FSUG Padova'},
  {time: '17.30 – 18.00', title: 'Installazione server LAMP', speaker: 'Dott. Emanuele Zamprogno - FSUG Padova'},
  {time: '18.00 – 18.40', title: 'Il software libero ti legge nel pensiero', speaker: 'Dr.  Enrico Calore, FSUG Padova'},
  {time: '18.10 – 18.45', title: 'Il ruolo del diritto d’autore nelle Biblioteche', speaker: 'Antonella De Robbio, Università di Padova'},
  {time: '18.40 – 19.20', title: 'Virtualizzare con LibVirt', speaker: 'Davide Bettio, KDE Developer, FSUG Padova'},
  {time: '18.45 – 19.15', title: 'Wikipedia: la lotta al vandalismo, metodologie di indagine', speaker: 'Marco Oggioni, Wikipedia Administrator, FSUG Padova'}
]
 

end

get '/' do
  @talks = settings.talks 
  erb :talks
end

# mi aspetto un title del tipo "Introduzione_al_Linux_Day"

get '/talks/:title' do
  title = params[:title].gsub('_',' ')
  @talk = settings.talks.select { |talk| talk[:title] == title }.first
  erb :talk
end
