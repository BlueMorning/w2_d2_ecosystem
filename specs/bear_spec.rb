require ("minitest/autorun")
require_relative("../bear")

class TestBear < Minitest::Test

  def setup
    @bear = Bear.new("Willis")
  end

  def test_get_bear_name
    assert_equal("Willis", @bear.name)
  end

  def test_get_bear_empty_stomach
    assert_equal([], @bear.eaten_fish)
  end

end
