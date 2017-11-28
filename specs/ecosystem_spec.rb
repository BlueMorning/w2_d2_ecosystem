require ("minitest/autorun")
require_relative("../ecosystem.rb")


class TestEcosystem < Minitest::Test

  def setup
    @ecosystem = Ecosystem.new(@bears, @river)
  end

  def test_get_bears
    assert_equal(@bears, @ecosystem.bears)
  end


end
