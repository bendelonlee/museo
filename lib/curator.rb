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
end
