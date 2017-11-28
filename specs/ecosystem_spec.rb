require ("minitest/autorun")
require_relative("../ecosystem.rb")
require_relative("../river.rb")
require_relative("../bear.rb")
require_relative("../fish.rb")


class TestEcosystem < Minitest::Test

  def setup

    @bear1 = Bear.new("Willis")
    @bear2 = Bear.new("Vandamme")
    @bear3 = Bear.new("Statham")

    @fish1 = Fish.new("Nemo")
    @fish2 = Fish.new("Clown")
    @fish3 = Fish.new("Jaw")
    @fish4 = Fish.new("Hannibal")
    @fish5 = Fish.new("Torpedo")


    @bears          = [@bear1, @bear2, @bear3]
    @fish           = [@fish1, @fish2, @fish3, @fish4, @fish5]
    @river_name     = "Amazon"
    @river          = River.new(@river_name, @fish)
    @ecosystem_name = "Canada"
    @ecosystem      = Ecosystem.new(@ecosystem_name, @bears, @river)
  end

  def test_get_ecosystem_name
    assert_equal("Canada", @ecosystem.name)
  end

  def test_get_bears
    assert_equal(@bears, @ecosystem.bears)
  end

  def test_get_river
    assert_equal(@river, @ecosystem.river)
  end

  def test_get_bear_by_name
    assert_equal(@bear1, @ecosystem.get_bear_by_name("Willis"))
  end

  def test_bears_eat_all_the_fish
    @ecosystem.bear_eat_all_the_fish()
    assert_equal(0, @river.get_nb_fish())
  end

  def test_get_all_fish_eaten_from_bears
    @ecosystem.bear_eat_all_the_fish()
    assert_equal(5 ,@ecosystem.get_all_fish_eaten_from_bears().count())
  end


end
