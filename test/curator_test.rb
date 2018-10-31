require './test/test_helper'
require './lib/curator'

class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new({})
    assert_instance_of Curator, curator
  end

  def test_curator_can_have_photos
    curator = Curator.new
    #=> #<Curator:0x00007fd3a0383dc8...>
    assert_equal [], curator.photographs
    #=> []
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    curator.add_photograph(photo_1)

    curator.add_photograph(photo_2)

    assert_equal 2, curator.photographs.size
    #=> [#<Photograph:0x00007fd3a10cda60...>, #<Photograph:0x00007fd3a1801278...>]

    first_photo = curator.photographs.first
    assert_equal '1', first_photo.artist_id
    assert_equal '1', first_photo.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", first_photo.name
    assert_equal '1954', first_photo.year
  end

  def test_curator_can_have_artists
    curator = Curator.new
    assert_equal [], curator.artists

    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator.add_artist(artist_1)

    curator.add_artist(artist_2)

    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
    #=> "Henri Cartier-Bresson"
  end

  # def test_artists_can_be_found_by_id
  #   curator.find_artist_by_id("1")
  #   #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
  # end
  # def test_photographs_can_be_found_by_id
  #   curator.find_photograph_by_id("2")
  #   #=> #<Photograph:0x00007fd3a1801278 @artist_id="2", @id="2", @name="Moonrise, Hernandez", @year="1941">
  # end

end
