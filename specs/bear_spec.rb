require ("minitest/autorun")
require_relative("../bear")
require_relative("../fish")
require_relative("../river")

class TestBear < Minitest::Test

  def setup
    @bear           = Bear.new("Willis")

    @fish1          = Fish.new("Nemo")
    @fish2          = Fish.new("Clown")
    @fish3          = Fish.new("Jaw")
    @fish4          = Fish.new("Hannibal")
    @fish5          = Fish.new("Torpedo")
    @fish           = [@fish1, @fish2, @fish3, @fish4, @fish5]
    @river          = River.new("Amazon", @fish)

    @river_empty    = River.new("Nil", [])

  end

  def test_get_bear_name
    assert_equal("Willis", @bear.name)
  end

  def test_get_bear_empty_stomach
    assert_equal([], @bear.eaten_fish)
  end


  def test_eat_a_fish_from_river__full
    @bear.eat_a_fish_from_river(@river)
    assert_equal(1, @bear.eaten_fish.count)
    assert_equal(4, @river.fish.count)
  end

  def test_eat_a_fish_from_river__empty
    @bear.eat_a_fish_from_river(@river_empty)
    assert_equal(0, @bear.get_nb_eaten_fish)
    assert_equal(0, @river_empty.get_nb_fish)
  end

end
