class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.text :writer
      t.text :actors
      t.text :plot
      t.string :language
      t.string :country
      t.text :awards
      t.string :poster
      t.string :metascore
      t.string :imdbrating
      t.string :imdbvotes
      t.string :imdbid
      t.string :type
      t.string :dvd
      t.string :boxoffice
      t.string :production
      t.string :website
      t.string :response
      t.text :ratings

      t.timestamps
    end
  end
end
