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

  def test_food_chain_cycle
    # Initialy 5 fish are in the river
    assert_equal(5 ,@river.get_nb_fish())

    # The bears eat all the fish
    @ecosystem.bear_eat_all_the_fish()
    # The total of fish eaten must be : 5
    assert_equal(5 ,@ecosystem.get_all_fish_eaten_from_bears().count())
    # The total of fish in the river is now : 0
    assert_equal(0 ,@river.get_nb_fish())

    # The river is repopulated with 999 fish
    @river.repopulate_river(999)
    # The total of fish in the river is now : 999
    assert_equal(999 ,@river.get_nb_fish())

    # The bear Willis eat 2 more fish
    willis = @ecosystem.get_bear_by_name("Willis")
    willis_nb_fish_eaten = willis.get_nb_eaten_fish()
    willis.eat_fish_by_name(@river, "Neo")
    willis.eat_fish_by_name(@river, "Speedy")
    assert_equal(willis_nb_fish_eaten+2 ,willis.get_nb_eaten_fish())

    # The bear Torpedo eat 1 more fish
    torpedo = @ecosystem.get_bear_by_name("Vandamme")
    torpedo_nb_fish_eaten = torpedo.get_nb_eaten_fish()
    torpedo.eat_fish_by_name(@river, "Turbo")
    assert_equal(torpedo_nb_fish_eaten+1 ,torpedo.get_nb_eaten_fish())

    # The river had been repopulated with 999 fish before Willis and Torpedo eat 3 more fish
    # The final expected number of fish is 999-3 = 996
    assert_equal(996 ,@river.get_nb_fish())

  end


end
