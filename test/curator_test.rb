require './test/test_helper'
require './lib/curator'

class CuratorTest < Minitest::Test
  def setup
    @curator = Curator.new({})
  end
  def setup_artists_and_photos
    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }

    @photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }

    @artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    @artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    @curator.add_photograph(photo_1)

    @curator.add_photograph(photo_2)

    @curator.add_photograph(photo_3)

    @curator.add_photograph(photo_4)

    @curator.add_artist(artist_1)

    @curator.add_artist(artist_2)

    @curator.add_artist(artist_3)
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_curator_can_have_photos
    #=> #<@curator:0x00007fd3a0383dc8...>
    assert_equal [], @curator.photographs
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

    @curator.add_photograph(photo_1)

    @curator.add_photograph(photo_2)

    assert_equal 2, @curator.photographs.size
    #=> [#<Photograph:0x00007fd3a10cda60...>, #<Photograph:0x00007fd3a1801278...>]

    first_photo = @curator.photographs.first
    assert_equal '1', first_photo.artist_id
    assert_equal '1', first_photo.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", first_photo.name
    assert_equal '1954', first_photo.year
  end

  def test_curator_can_have_artists
    assert_equal [], @curator.artists

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

    @curator.add_artist(artist_1)

    @curator.add_artist(artist_2)

    assert_equal "Henri Cartier-Bresson", @curator.artists.first.name
    #=> "Henri Cartier-Bresson"
  end

  def test_artists_can_be_found_by_id
    @curator.add_artist(id: '1', name:"Henri Cartier-Bresson")
    @curator.add_artist(id: '2', name:"Bob")
    actual = @curator.find_artist_by_id("1")
    assert_equal "Henri Cartier-Bresson", actual.name
    #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
  end
  def test_photographs_can_be_found_by_id
    @curator.add_photograph(id: '2', name:"Moonrise, Hernandez")
    @curator.add_photograph(id: '1', name:"Flowers")
    actual = @curator.find_photograph_by_id("2")
    assert_equal "Moonrise, Hernandez", actual.name
    #=> #<Photograph:0x00007fd3a1801278 @artist_id="2", @id="2", @name="Moonrise, Hernandez", @year="1941">
  end

  def test_find_photographs_by_artist
    diane_arbus = @curator.find_artist_by_id("3")
    acutal @curator.find_photographs_by_artist(diane_arbus)
    assert_equal 2, actual.size
    assert_equal 3, actual[0].artist_id

  end
  #
  #
  # curator.artists_with_multiple_photographs
  # #=> [#<Artist:0x00007fa3c13eef88 @born="1923", @country="United States", @died="1971", @id="3", @name="Diane Arbus">]
  #
  # curator.artists_with_multiple_photographs.length
  # #=> 1
  #
  # diane_arbus == curator.artists_with_multiple_photographs.first
  # #=> true
  #
  # curator.photographs_taken_by_artists_from("United States")
  # #=> [#<Photograph:0x00007fa3c286b088...>, #<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
  #
  # curator.photographs_taken_by_artists_from("Argentina")
  # #=> []
  # ```

end
