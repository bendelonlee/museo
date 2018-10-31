require './test/test_helper'
require './lib/photograph'

class PhotographTest < Minitest::Test
  def test_it_exists
    photo = Photograph.new
    assert_instance_of Photograph, photo
  end
end
