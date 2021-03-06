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

  def test_eat_fish_by_name
    @bear.eat_fish_by_name(@river, "Jaw")
    assert_equal(true, (@bear.eaten_fish.select{|fish| fish.name == "Jaw"}).count() == 1)
  end

  def test_eat_fish_by_name_not_existing
    @bear.eat_fish_by_name(@river, "Jacky")
    assert_equal(false, (@bear.eaten_fish.select{|fish| fish.name == "Jaw"}).count() == 1)
  end

  def test_grunt_yummy_when_eating_fish
    assert_equal("Jaw yummy yummy !", @bear.grunt_yummy_when_eating_fish(@river, "Jaw"))
  end

end
