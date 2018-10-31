require './test/test_helper'
require './lib/artist'

class ArtistTest < Minitest::Test
  def test_it_exists
    artist = Artist.new({})
    assert_instance_of Artist, artist
  end

  def test_it_can_be_intialized_with_attributes
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)
    assert_equal 'Ansel Adams', artist.id
    assert_equal '1902', artist.name
    assert_equal '1984', artist.born
    assert_equal 'United States', artist.died
  end
end
