require ("minitest/autorun")
require_relative("../ecosystem.rb")
require_relative("../river.rb")


class TestEcosystem < Minitest::Test

  def setup
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




end
