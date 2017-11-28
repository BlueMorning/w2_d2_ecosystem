require("minitest/autorun")
require_relative("../fish.rb")
require_relative("../river.rb")

class TestRiver < Minitest::Test

  def setup
    @fish1 = Fish.new("Nemo")
    @fish2 = Fish.new("Clown")
    @fish3 = Fish.new("Jaw")
    @fish4 = Fish.new("Hannibal")
    @fish5 = Fish.new("Torpedo")
    @fish  = [@fish1, @fish2, @fish3, @fish4, @fish5]
    @river = River.new("Amazon", @fish)
  end

  def test_get_fish
    assert_equal(@fish, @river.fish)
  end



end
