require './lib/artist'
require './lib/photograph'
require './lib/file_io'

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

  def photographs_taken_between(range)
    @photographs.find_all do |photograph|
      photograph.year.to_i.between?(range.min, range.max)
    end
  end

  def artists_photographs_by_age(artist)

    find_photographs_by_artist(artist).reduce({}) do |result, photograph|
      result[artist.age_in(photograph.year)] = photograph.name
      result
    end
  end

  def load_photographs(file)
    FileIO.load_photographs(file).each do |photograph_hash|
      @photographs << Photograph.new(photograph_hash)
    end
  end

  def load_artists(file)
    FileIO.load_artists(file).each do |artist_hash|
      @artists << Artist.new(artist_hash)
    end
  end

end
