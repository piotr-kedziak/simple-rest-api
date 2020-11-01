require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe '#title' do
    it { is_expected.to validate_presence_of :title }
  end

  describe '#title_for_omdb' do
    let(:movie) { build :movie }

    it 'should be parameterized with + separator' do
      expect(movie.title_for_omdb).to eq movie.title.parameterize(separator: '+')
    end
  end

  describe '#fetch_from_omdb' do
    context 'with a valid movie title' do
      let!(:movie) { build :movie, title: 'The Lion King' }
      let!(:data)  { JSON.parse File.open(File.dirname(__FILE__) + '/../support/api/omdb/movie.json', 'rb').read }

      before { movie.fetch_from_omdb }

      it 'should populate title field' do
        expect(movie.title).to eq data['Title']
      end

      it 'should populate year field' do
        expect(movie.year).to eq data['Year']
      end

      it 'should populate rated field' do
        expect(movie.rated).to eq data['Rated']
      end

      it 'should populate released field' do
        expect(movie.released).to eq data['Released']
      end

      it 'should populate runtime field' do
        expect(movie.runtime).to eq data['Runtime']
      end

      it 'should populate genre field' do
        expect(movie.genre).to eq data['Genre']
      end

      it 'should populate director field' do
        expect(movie.director).to eq data['Director']
      end

      it 'should populate writer field' do
        expect(movie.writer).to eq data['Writer']
      end

      it 'should populate actors field' do
        expect(movie.actors).to eq data['Actors']
      end

      it 'should populate plot field' do
        expect(movie.plot).to eq data['Plot']
      end

      it 'should populate language field' do
        expect(movie.language).to eq data['Language']
      end

      it 'should populate country field' do
        expect(movie.country).to eq data['Country']
      end

      it 'should populate awards field' do
        expect(movie.awards).to eq data['Awards']
      end

      it 'should populate poster field' do
        expect(movie.poster).to eq data['Poster']
      end

      it 'should populate ratings field' do
        expect(movie.ratings).to eq data['Ratings']
      end

      it 'should populate metascore field' do
        expect(movie.metascore).to eq data['Metascore']
      end

      it 'should populate imdbrating field' do
        expect(movie.imdbrating).to eq data['imdbRating']
      end

      it 'should populate imdbvotes field' do
        expect(movie.imdbvotes).to eq data['imdbVotes']
      end

      it 'should populate imdbid field' do
        expect(movie.imdbid).to eq data['imdbID']
      end

      it 'should populate type field' do
        expect(movie.type).to eq data['Type']
      end

      it 'should populate dvd field' do
        expect(movie.dvd).to eq data['DVD']
      end

      it 'should populate boxoffice field' do
        expect(movie.boxoffice).to eq data['BoxOffice']
      end

      it 'should populate production field' do
        expect(movie.production).to eq data['Production']
      end

      it 'should populate website field' do
        expect(movie.website).to eq data['Website']
      end
    end
  end
end
