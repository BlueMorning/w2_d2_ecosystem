require("minitest/autorun")
require_relative("../fish.rb")

class TestFish

  def setup
    @fish = Fish.new("Boby")
  end

  def test_get_fish_name
    assert_equal("Boby", @fish.name)
  end


end
