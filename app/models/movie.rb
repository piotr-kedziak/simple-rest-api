class Movie < ApplicationRecord
  serialize :ratings, JSON

  validates :title, presence: true

  def title_for_omdb
    title.parameterize(separator: '+')
  end

  def fetch_from_omdb
    r = Faraday.get "http://www.omdbapi.com/?apikey=#{Rails.application.credentials.omdbapi_key}&t=#{title_for_omdb}"
    info = JSON.parse r.body

    self.title      = info['Title']
    self.year       = info['Year']
    self.rated      = info['Rated']
    self.released   = info['Released']
    self.runtime    = info['Runtime']
    self.genre      = info['Genre']
    self.director   = info['Director']
    self.writer     = info['Writer']
    self.actors     = info['Actors']
    self.plot       = info['Plot']
    self.language   = info['Language']
    self.country    = info['Country']
    self.awards     = info['Awards']
    self.poster     = info['Poster']
    self.ratings    = info['Ratings']
    self.metascore  = info['Metascore']
    self.imdbrating = info['imdbRating']
    self.imdbvotes  = info['imdbVotes']
    self.imdbid     = info['imdbID']
    self.type       = info['Type']
    self.dvd        = info['DVD']
    self.boxoffice  = info['BoxOffice']
    self.production = info['Production']
    self.website    = info['Website']
  end

end
