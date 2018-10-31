require './test/test_helper'
require './lib/photograph'

class PhotographTest < Minitest::Test
  def test_it_exists
    photo = Photograph.new({})
    assert_instance_of Photograph, photo
  end

  def test_it_can_be_intialized_with_attributes
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }
    photo = Photograph.new(attributes)
    assert_equal '1', photo.id
    assert_equal '4', photo.artist_id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", photo.name
    assert_equal "1954", photo.year
  end
end
