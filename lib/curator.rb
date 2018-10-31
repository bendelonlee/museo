require './lib/artist'
require './lib/photograph'

class Curator
  attr_reader :photographs, :artists
  def initialize(arg = nil)
    @photographs = []
    @artists = []
  end
  def add_artist(attributes)
    @artists << Artist.new(attributes)
  end
  def add_photograph(attributes)
    @photographs << Photograph.new(attributes)
  end
  def find_photograph_by_id(id)
    @photographs.find{ |photo| photo.id == id }
  end

  def find_artist_by_id(id)
    @artists.find{ |artist| artist.id == id }
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all{ |photograph| photograph.artist_id == artist.id }
  end

  def artists_with_multiple_photographs
    @artists.find_all do |artist|
      find_photographs_by_artist(artist).size > 1
    end
  end

  def find_photographs_by_artists(artists)
    artists.reduce([]) do |result, artist|
      result += find_photographs_by_artist(artist)
    end
  end

  def photographs_taken_by_artists_from(country)
    artists = @artists.find_all { |artist| artist.country == country }
    find_photographs_by_artists(artists)
  end
end
