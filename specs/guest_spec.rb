require ("minitest/autorun")
require ("minitest/rg")

require_relative ("../guest")


class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Tommy", "poison", 50)
  end

  def test_has_name
    assert_equal("Tommy", @guest.name)
  end

  def test_has_favourite_song
    assert_equal("poison", @guest.favourite_song)
  end

  def test_has_money
    assert_equal(50.00, @guest.money)
  end

  def test_can_lose_money
    @guest.pay_up(20)
    assert_equal(30, @guest.money)
  end

  def test_cheer_for_favourite_song
    song = "poison"
    assert_equal("WOOHOO!!!", @guest.cheer(song))
  end

end
