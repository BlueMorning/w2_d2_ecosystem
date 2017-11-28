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

  def test_get_nb_fish
    assert_equal(5, @river.get_nb_fish())
  end

  def test_remove_fish
    fish_caught = @river.remove_fish()
    assert_equal(@fish5, fish_caught)
    assert_equal(4, @river.get_nb_fish)
  end

end
