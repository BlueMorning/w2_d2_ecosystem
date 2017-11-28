require ("minitest/autorun")
require_relative("../bear")
require_relative("../fish")
require_relative("../river")

class TestBear < Minitest::Test

  def setup
    @bear_empty     = Bear.new("Willis")

    @fish1          = Fish.new("Nemo")
    @fish2          = Fish.new("Clown")
    @fish3          = Fish.new("Jaw")
    @fish4          = Fish.new("Hannibal")
    @fish5          = Fish.new("Torpedo")
    @river_name     = "Amazon"
    @fish           = [@fish1, @fish2, @fish3, @fish4, @fish5]
    @river          = River.new(@river_name, @fish)

    @bear_full      = Bear.new("Hungry")

  end

  def test_get_bear_name
    assert_equal("Willis", @bear_empty.name)
  end

  def test_get_bear_empty_stomach
    assert_equal([], @bear_empty.eaten_fish)
  end

  def test_eat_a_fish_from_river__full
    @bear_full.eat_a_fish_from_river(@river)
    assert_equal(1, @bear_full.eaten_fish.count)
    assert_equal(4, @river.fish.count)
  end

end
